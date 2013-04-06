//
// Created by robertgill on 05/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "FMDBDatabase.h"
#import "FMDatabase.h"
#import "FMDBResult.h"

@implementation FMDBDatabase

- (void)open
{
    _database = [FMDatabase databaseWithPath:self.databasePath];

    [_database open];
}

- (void)close
{
    [_database close];
}

- (DatabaseResult *)executeQuery:(NSString *)query
{
    return [[FMDBResult alloc] initWithObject:[_database executeQuery:query]];
}

- (DatabaseResult *)executeQuery:(NSString *)query WithParameters:(NSArray *)parameters
{
    return [[FMDBResult alloc] initWithObject:[_database executeQuery:query withArgumentsInArray:parameters]];
}

- (BOOL)executeUpdate:(NSString *)query
{
    return [_database executeUpdate:query];
}

- (BOOL)executeUpdate:(NSString *)query WithParamaters:(NSArray *)paramaters
{
    return [_database executeUpdate:query withArgumentsInArray:paramaters];
}

@end