//
// Created by robertgill on 06/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Database.h"


@interface TestDatabase : Database
@property(nonatomic, copy) NSString *lastQuery;
@property(nonatomic, strong) NSArray *lastParameterSet;
@end