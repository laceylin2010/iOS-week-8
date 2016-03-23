//
//  HotelManagerTests.m
//  HotelManagerTests
//
//  Created by Lacey Vu on 3/23/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSManagedObjectContext+Additions.h"

@interface HotelManagerTests : XCTestCase

@property (strong, nonatomic) NSManagedObjectContext *context;

@end

@implementation HotelManagerTests


- (void)setUp {
    [super setUp];
    self.context = [NSManagedObjectContext currentContext];
    //called before test method is run
}

- (void)tearDown {
    //called after test method is run
    [super tearDown];
}

- (void)testDatabaseInfo
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
    request.resultType = NSCountResultType;
    
    NSArray *results = [self.context executeFetchRequest:request error:nil];
    NSNumber *count = results.firstObject;
    
    XCTAssert(count > 0, @"Database should not be empty");
}


@end
