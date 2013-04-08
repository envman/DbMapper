//
// Created by robertgill on 07/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "Test_DataHelper.h"
#import "DataHelper.h"
#import "DataHelperTestObject.h"

@implementation Test_DataHelper

- (void)testGetPropertyType_TypeIsString
{
    NSString *type = [DataHelper getPropertyType:[DataHelperTestObject class] WithName:@"string"];
    STAssertEqualObjects(type, TYPE_NSSTRING, @"Type should be NSString - %@", type);
}

- (void)testGetPropertyType_TypeIsInt
{
    NSString *type = [DataHelper getPropertyType:[DataHelperTestObject class] WithName:@"numberInt"];
    STAssertEqualObjects(type, TYPE_INT, @"Type should be int - %@", type);
}

- (void)testGetPropertyType_TypeIsObject
{
    NSString *type = [DataHelper getPropertyType:[DataHelperTestObject class] WithName:@"subObject"];
    STAssertEqualObjects(type, @"DataHelperTestSubObject", @"Type should be object - %@", type);
}

@end