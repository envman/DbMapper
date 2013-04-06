//
// Created by robertgill on 05/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <objc/runtime.h>
#import "Mappable.h"
#import "Mapping.h"
#import "Database.h"
#import "DatabaseResult.h"
#import "DataHelper.h"


@implementation Mappable
{

@private
    NSMutableArray *_mappings;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        _id = NOT_SAVED;
        _primaryKeyName = @"Id";

        _mappings = [NSMutableArray array];

        self.tableName = NSStringFromClass([self class]);
    }

    return self;
}

- (void)fetchWithId:(NSUInteger)id
{
    _id = id;

    [self fetch];
}

-(void)fetch
{
    NSString *query = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE %@ = ?", self.tableName, self.primaryKeyName];
    NSArray *parameters = @[@(_id)];

    DatabaseResult *result = [[Database instance] executeQuery:query WithParameters:parameters];

    if ([result next])
    {
        for (NSUInteger i = 0; i < _mappings.count; i++)
        {
            Mapping *mapping = _mappings[i];

            NSString *propertyType = [DataHelper getPropertyType:[self class] WithName:mapping.property];
            if ([propertyType isEqualToString:TYPE_NSSTRING])
            {
                [self setValue:[result stringForColumn:mapping.column] forKey:mapping.property];
            }
            else if ([propertyType isEqualToString:TYPE_INT])
            {
                [self setValue:@([result intForColumn:mapping.column]) forKey:mapping.property];
            }

        }
    }
}

- (void)save
{
    if (_id == NOT_SAVED)
    {
        [self insert];
    }
    else
    {
        [self update];
    }
}

- (void)update
{
    NSString *query = [NSString stringWithFormat:@"UPDATE %@ SET ", self.tableName];
    NSMutableArray *parameters = [NSMutableArray arrayWithCapacity:_mappings.count];

    for (NSUInteger i = 0; i < _mappings.count; i++)
    {
        Mapping *mapping = _mappings[i];

        query = [query stringByAppendingString:[NSString stringWithFormat:@"%@ = ?", mapping.column]];

        if (i != _mappings.count - 1)
        {
            query = [query stringByAppendingString:@","];
        }
        else
        {
            query = [query stringByAppendingString:[NSString stringWithFormat:@" WHERE %@ = %i", _primaryKeyName, _id]];
        }

        id value = [self valueForKey:mapping.property];
        [parameters addObject:value];
    }

    [[Database instance] executeUpdate:query WithParamaters:parameters];
}

- (void)insert
{
    NSString *query = [NSString stringWithFormat:@"INSERT INTO %@ (", self.tableName];
    NSString *valueString = @"VALUES (";

    NSMutableArray *parameters = [NSMutableArray arrayWithCapacity:_mappings.count];

    for (NSUInteger i = 0; i < _mappings.count; i++)
    {
        Mapping *mapping = _mappings[i];

        query = [query stringByAppendingString:mapping.column];
        valueString = [valueString stringByAppendingString:@"?"];

        if (i != _mappings.count - 1)
        {
            query = [query stringByAppendingString:@","];
            valueString = [valueString stringByAppendingString:@","];
        }
        else
        {
            query = [query stringByAppendingString:@") "];
            valueString = [valueString stringByAppendingString:@")"];
        }

        id value = [self valueForKey:mapping.property];
        [parameters addObject:value];
    }

    query = [query stringByAppendingString:valueString];

    [[Database instance] executeUpdate:query WithParamaters:parameters];
}

- (void)addMapping:(NSString *)property
{
    [self addMapping:property ToColumn:property];
}

- (void)addMapping:(NSString *)property ToColumn:(NSString *)columnName
{
    Mapping *mapping = [Mapping new];

    mapping.column = columnName;
    mapping.property = property;

    [_mappings addObject:mapping];
}

@end