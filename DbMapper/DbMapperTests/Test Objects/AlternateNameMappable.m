//
// Created by robertgill on 06/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "AlternateNameMappable.h"


@implementation AlternateNameMappable

- (id)init
{
    self = [super init];
    if (self)
    {
        self.testString = @"test";
        [self addMapping:@"testString" ToColumn:@"TestColumn"];
    }

    return self;
}


@end