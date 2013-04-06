//
// Created by robertgill on 06/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "FMDBResult.h"
#import "DatabaseResult.h"


@implementation DatabaseResult
{

}

- (DatabaseResult *)initWithObject:(id)object
{
    [NSException raise:@"Not Implemented" format:@"This method should be overridden!"];
}

- (BOOL)next
{
    [NSException raise:@"Not Implemented" format:@"This method should be overridden!"];
}

- (NSString *)stringForColumn:(NSString *)columnName
{
    [NSException raise:@"Not Implemented" format:@"This method should be overridden!"];
}

- (NSInteger)intForColumn:(NSString *)columnName
{
    [NSException raise:@"Not Implemented" format:@"This method should be overridden!"];
}
@end