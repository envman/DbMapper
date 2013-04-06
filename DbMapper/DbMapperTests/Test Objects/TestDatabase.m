//
// Created by robertgill on 06/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "TestDatabase.h"
#import "DatabaseResult.h"


@implementation TestDatabase

- (void)open
{
    
}

- (void)close
{
    
}

- (DatabaseResult *)executeQuery:(NSString *)query
{
    self.lastQuery = query;
    return nil;
}

- (BOOL)executeUpdate:(NSString *)query
{
    self.lastQuery = query;
    return NO;
}

- (BOOL)executeUpdate:(NSString *)query WithParamaters:(NSArray *)array
{
    _lastQuery = query;
    _lastParameterSet = array;
}


@end