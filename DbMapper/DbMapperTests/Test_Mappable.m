//
// Created by robertgill on 06/04/2013.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <objc/runtime.h>
#import "Test_Mappable.h"
#import "Database.h"
#import "TestDatabase.h"
#import "TestMappable.h"
#import "MultipleTestMappable.h"
#import "AlternateNameMappable.h"
#import "DataHelper.h"


@implementation Test_Mappable

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
    TestMappable *mappable = [TestMappable new];

    [mappable save];

    TestDatabase *testDatabase = (TestDatabase *) [Database instance];

    NSString *lastQuery = testDatabase.lastQuery;
    NSArray *queryParts = [lastQuery componentsSeparatedByString:@" "];

    if (![queryParts[0] isEqualToString:@"INSERT"])
    {
        STFail(@"Incorrect String generated., %@", lastQuery);
    }

    NSLog(@"Test passed with query: %@", lastQuery);
}

- (void)testSave_RunsUpdate
{
    TestMappable *mappable = [TestMappable new];
    mappable.id = 3;
    [mappable save];

    TestDatabase *testDatabase = (TestDatabase *) [Database instance];

    NSString *lastQuery = testDatabase.lastQuery;
    NSArray *queryParts = [lastQuery componentsSeparatedByString:@" "];

    if (![queryParts[0] isEqualToString:@"UPDATE"])
    {
        STFail(@"Incorrect String generated., %@", lastQuery);
    }

    NSLog(@"Test passed with query: %@", lastQuery);
}

- (void)testSave_CorrectInsertQuery
{
    TestMappable *mappable = [TestMappable new];
    [mappable save];

    TestDatabase *testDatabase = (TestDatabase *) [Database instance];

    NSString *lastQuery = testDatabase.lastQuery;
    NSString *correctQuery = @"INSERT INTO TestMappable (testMappingString) VALUES (?)";

    STAssertEqualObjects(lastQuery, correctQuery, @"Query not correct %@", lastQuery);
    NSLog(@"Test passed with query: %@", lastQuery);
}

- (void)testSave_MultipleInsert
{
    MultipleTestMappable *mappable = [MultipleTestMappable new];

    mappable.testString = @"Test1";
    mappable.testNumber = 5;
    mappable.secondNumber = 9;

    [mappable save];

    TestDatabase *testDatabase = (TestDatabase *) [Database instance];

    NSString *lastQuery = testDatabase.lastQuery;
    NSString *correctQuery = @"INSERT INTO MultipleTestMappable (testString,testNumber,secondNumber) VALUES (?,?,?)";

    NSArray *array = testDatabase.lastParameterSet;

    STAssertEqualObjects(array[0], @"Test1", @"String should be Test1 %@", array[0]);
    STAssertEqualObjects(array[1], @4, @"int should be 5 %i", array[1]);
    STAssertEqualObjects(array[2], @9, @"int should be 9 %i", array[2]);

    STAssertEqualObjects(lastQuery, correctQuery, @"Query not correct %@", lastQuery);
    NSLog(@"Test passed with query: %@", lastQuery);
}

- (void)testSave_TableNameOverride
{
    TestMappable *mappable = [TestMappable new];
    mappable.tableName = @"NewTableName";
    [mappable save];

    TestDatabase *testDatabase = (TestDatabase *) [Database instance];

    NSString *lastQuery = testDatabase.lastQuery;
    NSString *correctQuery = @"INSERT INTO NewTableName (testMappingString) VALUES (?)";

    STAssertEqualObjects(lastQuery, correctQuery, @"Query not correct %@", lastQuery);
    NSLog(@"Test passed with query: %@", lastQuery);
}

- (void)testSave_TestAlternateNameMappable
{
    AlternateNameMappable *mappable = [AlternateNameMappable new];
    [mappable save];

    TestDatabase *testDatabase = (TestDatabase *) [Database instance];

    NSString *lastQuery = testDatabase.lastQuery;
    NSString *correctQuery = @"INSERT INTO AlternateNameMappable (TestColumn) VALUES (?)";

    STAssertEqualObjects(lastQuery, correctQuery, @"Query not correct %@", lastQuery);
    NSLog(@"Test passed with query: %@", lastQuery);
}

- (void)test
{
    MultipleTestMappable *mappable = [MultipleTestMappable new];

    NSString *type = [DataHelper getPropertyType:[mappable class] WithName:@"testNumber"];
    NSLog(@"%@", type);
}

@end