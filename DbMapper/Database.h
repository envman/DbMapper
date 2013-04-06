//
// Created by robertgill on 06/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class FMResultSet;
@class DatabaseResult;


@interface Database : NSObject
+ (Database *)instance;

+ (void)setClass:(Class)class;

+ (void)dropInstance;

- (void)open;

- (void)close;

- (DatabaseResult *)executeQuery:(NSString *)query;

- (BOOL)executeUpdate:(NSString *)query;

- (BOOL)executeUpdate:(NSString *)query WithParamaters:(NSArray *)array;

- (DatabaseResult *)executeQuery:(NSString *)query WithParameters:(NSArray *)parameters;
@end