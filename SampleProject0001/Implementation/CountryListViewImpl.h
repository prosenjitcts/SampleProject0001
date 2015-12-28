//
//  CountryListViewImpl.h
//  SampleProject0001
//
//  Created by MacMini7 on 12/28/15.
//  Copyright (c) 2015 MacMini7. All rights reserved.
//

#import  <Foundation/Foundation.h>
#import  "CountryListViewImplDelegate.h"
#import  "CountryListViewDelegate.h"

@interface CountryListViewImpl : NSObject

@property (nonatomic,strong) id <CountryListViewDelegate> countryListViewPresenter;

- (instancetype)initWithCountryListViewPresenter:(id<CountryListViewDelegate>)countryListPresenter;

- (void)loadCountryListFromPlist ;
@end
