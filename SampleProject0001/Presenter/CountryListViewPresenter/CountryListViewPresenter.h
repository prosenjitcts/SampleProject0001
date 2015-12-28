//
//  CountryListViewPresenter.h
//  SampleProject0001
//
//  Created by MacMini7 on 12/28/15.
//  Copyright (c) 2015 MacMini7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CountryListViewDelegate.h"
#import "CountryListViewControllerCallback.h"

@interface CountryListViewPresenter : NSObject<CountryListViewDelegate>

@property(nonatomic, strong) id<CountryListViewControllerCallback> countryListViewController;

- (instancetype)initWithCountryListViewController:(id<CountryListViewControllerCallback>)countryListViewController;

- (BOOL)isMinimumItemsSelected:(NSArray *)selectedArray;
- (BOOL)isMaximumItemsSelected:(NSArray *)selectedArray;
@end
