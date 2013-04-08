//
// Created by robertgill on 08/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "TestMapping.h"
#import "TestMappedObject.h"


@implementation TestMapping

- (id)init
{
    self = [super init];
    if (self)
    {
        self.mappedObject = [TestMappedObject new];

        [self addMapping:@"testString"];
        [self addMapping:@"testInt"];
    }

    return self;
}


@end