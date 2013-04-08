//
// Created by robertgill on 08/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Test_Mapping.h"
#import "TestDatabase.h"
#import "TestMapping.h"


@implementation Test_Mapping

- (void)setUp
{
    [Database setClass:[TestDatabase class]];
}

- (void)tearDown
{
    [Database dropInstance];
}

- (void)testSave_RunsInsert
{
    TestMapping *mapping = [TestMapping new];

    [mapping save];

    TestDatabase *testDatabase = (TestDatabase *) [Database instance];

    NSString *lastQuery = testDatabase.lastQuery;
    NSArray *queryParts = [lastQuery componentsSeparatedByString:@" "];

    if (![queryParts[0] isEqualToString:@"INSERT"])
    {
        STFail(@"Incorrect String generated., %@", lastQuery);
    }
}

- (void)testSave_RunsUpdate
{
    TestMapping *mapping = [TestMapping new];
    mapping.id = 3;
    [mapping save];

    TestDatabase *testDatabase = (TestDatabase *) [Database instance];

    NSString *lastQuery = testDatabase.lastQuery;
    NSArray *queryParts = [lastQuery componentsSeparatedByString:@" "];

    if (![queryParts[0] isEqualToString:@"UPDATE"])
    {
        STFail(@"Incorrect String generated., %@", lastQuery);
    }
}

@end