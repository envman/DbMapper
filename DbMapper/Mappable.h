//
// Created by robertgill on 05/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


static const int NOT_SAVED = -1;

@interface Mappable : NSObject
@property(nonatomic) NSInteger id;

@property(nonatomic, copy) NSString *tableName;

@property(nonatomic, copy) NSString *primaryKeyName;

- (void)fetchWithId:(NSUInteger)id1;

- (void)save;

- (void)addMapping:(NSString *)property;

- (void)addMapping:(NSString *)property ToColumn:(NSString *)columnName;

@end