//
// Created by robertgill on 06/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface DatabaseResult : NSObject
- (DatabaseResult *)initWithObject:(id)object;

- (BOOL)next;

- (NSString *)stringForColumn:(NSString *)columnName;

- (NSInteger)intForColumn:(NSString *)columnName;
@end