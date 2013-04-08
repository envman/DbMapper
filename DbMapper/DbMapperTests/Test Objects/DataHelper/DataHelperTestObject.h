//
// Created by robertgill on 07/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class DataHelperTestSubObject;


@interface DataHelperTestObject : NSObject
@property(nonatomic, copy) NSString *string;
@property(nonatomic) int numberInt;
@property(nonatomic, strong) DataHelperTestSubObject *subObject;
@end