//
// Created by robertgill on 06/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "FMDBResult.h"
#import "FMDatabase.h"
#import "FMDBDatabase.h"
#import "DatabaseResult.h"


@implementation Database

static Class _instanceClass;
static Database *_instance = nil;

+ (Database *)instance
{

    @synchronized (self)
    {
        if (_instance == nil)
        {
            _instance = [_instanceClass new];
        }
    }

    return _instance;
}

+ (void)setClass:(Class)class
{
    _instanceClass = class;
}

+ (void)dropInstance
{
    _instance = nil;
}

- (void)open
{
    [NSException raise:@"Not Implemented" format:@"This method should be overridden!"];
}

-(void)close
{
    [NSException raise:@"Not Implemented" format:@"This method should be overridden!"];
}

- (DatabaseResult *)executeQuery:(NSString *)query
{
    [NSException raise:@"Not Implemented" format:@"This method should be overridden!"];
}

- (BOOL)executeUpdate:(NSString *)query
{
    [NSException raise:@"Not Implemented" format:@"This method should be overridden!"];
}

- (BOOL)executeUpdate:(NSString *)query WithParamaters:(NSArray *)array
{
    [NSException raise:@"Not Implemented" format:@"This method should be overridden!"];
}

- (DatabaseResult *)executeQuery:(NSString *)query WithParameters:(NSArray *)parameters
{
    [NSException raise:@"Not Implemented" format:@"This method should be overridden!"];
}
@end