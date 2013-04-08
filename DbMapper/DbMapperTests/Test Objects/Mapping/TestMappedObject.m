//
// Created by robertgill on 08/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "TestMappedObject.h"


@implementation TestMappedObject

- (id)init
{
    self = [super init];
    if (self)
    {
        self.testString = @"test";
        self.testInt = 5;
    }

    return self;
}

@end