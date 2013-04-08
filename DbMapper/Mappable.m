//
// Created by robertgill on 05/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Mappable.h"

@implementation Mappable

- (id)init
{
    self = [super init];
    if (self)
    {
        self.mappedObject = self;
    }

    return self;
}

@end