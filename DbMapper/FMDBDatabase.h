//
// Created by robertgill on 05/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Database.h"

@class FMDatabase;


@interface FMDBDatabase : Database
@property(nonatomic, copy) NSString *databasePath;
@property(nonatomic, strong) FMDatabase *database;

@end