//
// Created by robertgill on 06/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "FMDBResult.h"
#import "FMResultSet.h"


@implementation FMDBResult

- (DatabaseResult *)initWithObject:(id)object
{
    self = [super initWithObject:object];
    if (self)
    {
        if ([object class] == [FMResultSet class])
        {
            _resultSet = (FMResultSet *)object;
        }
    }

    return self;
}

- (BOOL)next
{
    return _resultSet.next;
}

- (NSString *)stringForColumn:(NSString *)columnName
{
    return [_resultSet stringForColumn:columnName];
}

- (NSInteger)intForColumn:(NSString *)columnName
{
    return [_resultSet intForColumn:columnName];
}


@end