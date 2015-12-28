//
//  CountryListTests.m
//  SampleProject0001
//
//  Created by MacMini7 on 12/28/15.
//  Copyright (c) 2015 MacMini7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "CountryListViewController.h"
#import "CountryListViewPresenter.h"
#import "CountryListViewImpl.h"
typedef NS_ENUM(NSUInteger, TestCaseType) {
    TestCaseTypeFalse = 1,
    TestCaseTypeTrue ,
    TestCaseTypeNil,
};
@interface CountryListTests : XCTestCase

@property(nonatomic,strong) NSArray *mockCountryLists;

@end

@implementation CountryListTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    [self countryFromPlist];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}


#pragma mark - 

- (void)countryFromPlist {
    
    self.mockCountryLists = [NSArray array];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"CountryList" ofType:@"plist"];
    NSMutableArray *listArray = [NSMutableArray arrayWithContentsOfFile:plistPath];
    self.mockCountryLists = listArray;
    
}
- (NSArray *)mockCountryItems:(NSInteger)nosOfCountry {
    
    if(nosOfCountry ==0 ) return nil;
    
    NSMutableArray *mockCountries =[NSMutableArray array];
    
    for (int i= 0;self.mockCountryLists.count  && i < self.mockCountryLists.count && i<nosOfCountry; i++) {
        
        NSString *countryName = [self.mockCountryLists objectAtIndex:i];
        [mockCountries addObject:countryName];
    }
    return mockCountries;
}

#pragma mark - 

- (void)testCountryListCointains {
    
    CountryListViewController * mockCountryListViewController = [[CountryListViewController alloc]init];
    
    id  <CountryListViewDelegate> countryListViewPresenter = [[CountryListViewPresenter alloc]initWithCountryListViewController:mockCountryListViewController];
    
    [countryListViewPresenter loadContent];
    
    NSInteger nosOfCountries = mockCountryListViewController.countryListContents.count;
    
    XCTAssertTrue(nosOfCountries);
    
}

- (void)testNilCountryListCointains {
    
    CountryListViewController * mockCountryListViewController = [[CountryListViewController alloc]init];
    
    NSInteger nosOfCountries = mockCountryListViewController.countryListContents.count;
    
    XCTAssertFalse(nosOfCountries);
    
}

#pragma mark Min Item Selected Test Cases

- (void)isMinItemsSelectedTestCasesForItems:(NSInteger)items testCaseType:(TestCaseType)testCaseType {
    CountryListViewPresenter * countryListViewPresenter = [[CountryListViewPresenter alloc]init];
    
    NSArray *mockSountryItems = [self mockCountryItems:items];
    
    switch (testCaseType) {
        case TestCaseTypeFalse:
        {
            BOOL isfailed =   [countryListViewPresenter isMinimumItemsSelected:mockSountryItems];
            
            XCTAssertFalse(isfailed);
        }
            break;
        case TestCaseTypeTrue:
        {
            BOOL isSucced =   [countryListViewPresenter isMinimumItemsSelected:mockSountryItems];
            
            XCTAssertTrue(isSucced);
        }
            break;
            
        default:
            break;
    }
    
    
}
- (void)testMinItemSelected_WhenNoItemsSeleced {
    
    [self isMinItemsSelectedTestCasesForItems:0 testCaseType:TestCaseTypeFalse];

}
- (void)testMinItemSelected_When2ItemsSeleced {
   
 
    [self isMinItemsSelectedTestCasesForItems:2 testCaseType:TestCaseTypeFalse];


}

- (void)testMiniumItemSelected_When3ItemsSeleced {
    
    [self isMinItemsSelectedTestCasesForItems:3 testCaseType:TestCaseTypeTrue];

    
}
- (void)testMiniumItemSelected_WhenMorethan3ItemsSeleced {
    
    [self isMinItemsSelectedTestCasesForItems:3 testCaseType:TestCaseTypeTrue];

    
}



#pragma mark Max Item Selected Test Cases

- (void)isMaximumItemsSelectedTestCasesForItems:(NSInteger)items testCaseType:(TestCaseType)testCaseType {
    CountryListViewPresenter * countryListViewPresenter = [[CountryListViewPresenter alloc]init];
    
    NSArray *mockSountryItems = [self mockCountryItems:items];
    
    switch (testCaseType) {
        case TestCaseTypeFalse:
        {
            BOOL isfailed =   [countryListViewPresenter isMaximumItemsSelected:mockSountryItems];
            
            XCTAssertFalse(isfailed);
        }
            break;
        case TestCaseTypeTrue:
        {
            BOOL isSucced =   [countryListViewPresenter isMaximumItemsSelected:mockSountryItems];
            
            XCTAssertTrue(isSucced);
        }
            break;
            
        default:
            break;
    }
    
    
}


- (void)testMaxItemSelected_WhenNoItemsSeleced {
    
    
    [self isMaximumItemsSelectedTestCasesForItems:0 testCaseType:TestCaseTypeFalse];
    
}
- (void)testMaxItemSelected_When2ItemsSeleced {
    
    [self isMaximumItemsSelectedTestCasesForItems:2 testCaseType:TestCaseTypeFalse];

    
}

- (void)testMaxiumItemSelected_When3ItemsSeleced {
    
    [self isMaximumItemsSelectedTestCasesForItems:10 testCaseType:TestCaseTypeTrue];
    
}
- (void)testMaxiumItemSelected_WhenMorethan30ItemsSeleced {
    
    [self isMaximumItemsSelectedTestCasesForItems:30 testCaseType:TestCaseTypeTrue];

    
}

#pragma mark -  Test WillSelection Processed

-(void)testWillSelectionProcessed_WhenNoItemsSeleced
{
    [self willSelectionProcessedTestCasesForItems:0 testCaseType:TestCaseTypeFalse];


}
-(void)testWillSelectionProcessed_When2ItemsSeleced
{
    [self willSelectionProcessedTestCasesForItems:2 testCaseType:TestCaseTypeTrue];

}
-(void)testWillSelectionProcessed_When10ItemsSeleced
{
    [self willSelectionProcessedTestCasesForItems:11 testCaseType:TestCaseTypeFalse];
    
}
-(void)testWillSelectionProcessed_When20ItemsSeleced
{
    [self willSelectionProcessedTestCasesForItems:20 testCaseType:TestCaseTypeFalse];
    
}
-(void)testWillSelectionProcessed_When23ItemsSeleced
{
    [self willSelectionProcessedTestCasesForItems:23 testCaseType:TestCaseTypeFalse];
    
}

- (void)willSelectionProcessedTestCasesForItems:(NSInteger)items testCaseType:(TestCaseType)testCaseType {
    CountryListViewPresenter * countryListViewPresenter = [[CountryListViewPresenter alloc]init];
    
    NSArray *mockSountryItems = [self mockCountryItems:items];
    
    switch (testCaseType) {
        case TestCaseTypeFalse:
        {
            BOOL isfailed =   [countryListViewPresenter willSelectionProcessed:mockSountryItems];
            
            XCTAssertFalse(isfailed);
        }
            break;
        case TestCaseTypeTrue:
        {
            BOOL isSucced =   [countryListViewPresenter willSelectionProcessed:mockSountryItems];
            
            XCTAssertTrue(isSucced);
        }
            break;
            
        default:
            break;
    }
   
    
}



#pragma mark -  Update Next Button State

-(void)testUpdateNextButtonState_WhenNoItemsSeleced
{
    [self updateNextButtonStateTestCasesForItems:0 testCaseType:TestCaseTypeFalse];
    
    
}
-(void)testUpdateNextButtonState_When2ItemsSeleced
{
    [self updateNextButtonStateTestCasesForItems:2 testCaseType:TestCaseTypeFalse];
    
    
}

-(void)testUpdateNextButtonState_When3ItemsSeleced
{
    [self updateNextButtonStateTestCasesForItems:3 testCaseType:TestCaseTypeTrue];
    
    
}

-(void)testUpdateNextButtonState_WhenMoreThan3ItemsSeleced
{
    [self updateNextButtonStateTestCasesForItems:4 testCaseType:TestCaseTypeTrue];
    
    
}
- (void)updateNextButtonStateTestCasesForItems:(NSInteger)items testCaseType:(TestCaseType)testCaseType {
    CountryListViewPresenter * countryListViewPresenter = [[CountryListViewPresenter alloc]init];
    
    NSArray *mockSountryItems = [self mockCountryItems:items];
    
    switch (testCaseType) {
        case TestCaseTypeFalse:
        {
            BOOL isfailed =   [countryListViewPresenter updateNextButtonState:mockSountryItems];
            
            XCTAssertFalse(isfailed);
        }
            break;
        case TestCaseTypeTrue:
        {
            BOOL isSucced =   [countryListViewPresenter updateNextButtonState:mockSountryItems];
            
            XCTAssertTrue(isSucced);
        }
            break;
            
        default:
            break;
    }
    
    
}

//Final
//- (void)updateCountryCountLabel:(NSArray *)selectedCountries;
@end
