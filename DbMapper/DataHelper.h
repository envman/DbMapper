//
// Created by robertgill on 06/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#define TYPE_NSSTRING @"NSString"
#define TYPE_INT @"i"
#define TYPE_LONG @"l"
#define TYPE_UNSIGNED_INT @"I"

@interface DataHelper : NSObject
+ (void)getPropertyList:(Class)class;
+ (NSString *)getPropertyType:(objc_property_t)property;

+ (NSString *)getPropertyType:(Class)class WithName:(NSString *)propertyName;

+ (BOOL)isNumberType:(NSString *)type;
@end