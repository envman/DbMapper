//
// Created by robertgill on 06/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "DatabaseResult.h"

@class FMResultSet;


@interface FMDBResult : DatabaseResult
@property(nonatomic, strong) FMResultSet *resultSet;

@end