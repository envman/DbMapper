//
// Created by robertgill on 06/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "TestMappable.h"


@implementation TestMappable
{

}
- (id)init
{
    self = [super init];
    if (self)
    {
        [self addMapping:@"testMappingString"];
        
        self.testMappingString = @"Test";
    }

    return self;
}

@end