//
//  CountryListViewImpl.m
//  SampleProject0001
//
//  Created by MacMini7 on 12/28/15.
//  Copyright (c) 2015 MacMini7. All rights reserved.
//

#import "CountryListViewImpl.h"

@implementation CountryListViewImpl



- (instancetype)initWithCountryListViewPresenter:(id<CountryListViewDelegate>)countryListPresenter{
    
    if(self = [super init])
    {
        _countryListViewPresenter = countryListPresenter;
        
    }

    return self;
    
}

- (void)loadCountryListFromPlist {
    
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"CountryList" ofType:@"plist"];
    NSMutableArray *listArray = [NSMutableArray arrayWithContentsOfFile:plistPath];
    
    [_countryListViewPresenter displaycontent:listArray];
}

@end
