//
// Created by robertgill on 05/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface Mapping : NSObject

@property (strong, nonatomic) NSString *property;
@property (strong, nonatomic) NSString *column;

@property(nonatomic) NSInteger id;
@property(nonatomic, copy) NSString *tableName;
@property(nonatomic, copy) NSString *primaryKeyName;

@property(nonatomic, strong) id mappedObject;

- (id)init;

- (void)fetchWithId:(NSUInteger)id1;

- (void)save;

- (void)addMapping:(NSString *)property;

- (void)addMapping:(NSString *)property ToColumn:(NSString *)columnName;
@end