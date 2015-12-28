//
//  ContryListTests.m
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

@interface ContryListTests : XCTestCase

@property(nonatomic,strong) NSArray *mockCountryLists;

@end

@implementation ContryListTests

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
- (NSArray *)mockSountryItems:(NSInteger)nosOfCountry {
    
    NSMutableArray *mockCountries =[NSMutableArray array];
    
    for (int i= 0;self.mockCountryLists.count  && i < self.mockCountryLists.count && i<nosOfCountry; i++) {
        
        NSString *contryName = [self.mockCountryLists objectAtIndex:i];
        [mockCountries addObject:contryName];
    }
    return mockCountries;
}

#pragma mark - 

- (void)testCountryListCointains {
    
    CountryListViewController * mockCountryListViewController = [[CountryListViewController alloc]init];
    
    id  <CountryListViewDelegate> countryListViewPresenter = [[CountryListViewPresenter alloc]initWithCountryListViewController:mockCountryListViewController];
    
    [countryListViewPresenter loadContent];
    
    NSInteger nosOfCountries = mockCountryListViewController.contryListContents.count;
    
    XCTAssertTrue(nosOfCountries);
    
}

- (void)testNilCountryListCointains {
    
    CountryListViewController * mockCountryListViewController = [[CountryListViewController alloc]init];
    
    NSInteger nosOfCountries = mockCountryListViewController.contryListContents.count;
    
    XCTAssertFalse(nosOfCountries);
    
}


- (void)testMiniumItemSelected_When2ItemsSeleced {
   
   CountryListViewPresenter * countryListViewPresenter = [[CountryListViewPresenter alloc]init];
    
    NSArray *mockSountryItems = [self mockSountryItems:2];
    
  BOOL isFailed =   [countryListViewPresenter isMinimumItemsSelected:mockSountryItems];
   
    XCTAssertFalse(isFailed);

}

- (void)testMiniumItemSelected_When3ItemsSeleced {
    
    CountryListViewPresenter * countryListViewPresenter = [[CountryListViewPresenter alloc]init];
    
    NSArray *mockSountryItems = [self mockSountryItems:3];
    
    BOOL isSuccess =   [countryListViewPresenter isMinimumItemsSelected:mockSountryItems];
    
    XCTAssertTrue(isSuccess);
    
}
- (void)testMiniumItemSelected_WhenMorethan3ItemsSeleced {
    
    CountryListViewPresenter * countryListViewPresenter = [[CountryListViewPresenter alloc]init];
    
    NSArray *mockSountryItems = [self mockSountryItems:4];
    
    BOOL isSuccess =   [countryListViewPresenter isMinimumItemsSelected:mockSountryItems];
    
    XCTAssertTrue(isSuccess);
    
}


@end
