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

@end

@implementation ContryListTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
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

- (void)testCountryListCointains {
    
    CountryListViewController * mockCountryListViewController = [[CountryListViewController alloc]init];
    
    id  <CountryListViewDelegate> countryListViewPresenter = [[CountryListViewPresenter alloc]initWithCountryListViewController:mockCountryListViewController];
    
    [countryListViewPresenter loadContent];
    
    NSInteger nosOfCountries = mockCountryListViewController.contryListContents.count;
    
    XCTAssertTrue(nosOfCountries);
    
}




@end
