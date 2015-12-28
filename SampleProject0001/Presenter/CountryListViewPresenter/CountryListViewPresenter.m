//
//  CountryListViewPresenter.m
//  SampleProject0001
//
//  Created by MacMini7 on 12/28/15.
//  Copyright (c) 2015 MacMini7. All rights reserved.
//

#import "CountryListViewPresenter.h"
#import "CountryListViewImpl.h"
@interface CountryListViewPresenter ()

@property(nonatomic,strong) CountryListViewImpl * countryListViewImpl;
@end

@implementation CountryListViewPresenter


#pragma mark - 
- (instancetype)initWithCountryListViewController:(id<CountryListViewControllerCallback>)countryListViewController {
    
    
    if (self = [super init])
    {
         _countryListViewController = countryListViewController;
        _countryListViewImpl = [[CountryListViewImpl alloc]initWithCountryListViewPresenter:self];
        
    }
    return self;
}

#pragma mark - 
- (void)loadContent{
    
    [_countryListViewImpl loadCountryListFromPlist];
}

- (void)displaycontent:(NSArray *)array{
    
    if(_countryListViewController
       && [_countryListViewController respondsToSelector:@selector(displayContent:)]) {
        
        [_countryListViewController displayContent:array];
    }
    
}
@end
