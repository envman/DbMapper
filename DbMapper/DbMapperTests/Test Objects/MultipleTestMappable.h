//
// Created by robertgill on 06/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Mappable.h"


@interface MultipleTestMappable : Mappable
@property(nonatomic, copy) NSString *testString;
@property(nonatomic) int testNumber;
@property(nonatomic) int secondNumber;
@end