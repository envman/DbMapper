//
// Created by robertgill on 06/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MultipleTestMappable.h"


@implementation MultipleTestMappable

- (id)init
{
    self = [super init];
    if (self)
    {
        self.testString = @"";
        self.testNumber = 1;
        self.secondNumber = 2;
        
        [self addMapping:@"testString"];
        [self addMapping:@"testNumber"];
        [self addMapping:@"secondNumber"];
    }

    return self;
}


@end