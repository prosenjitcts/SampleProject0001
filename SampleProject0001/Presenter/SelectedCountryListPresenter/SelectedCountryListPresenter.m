//
//  SelectedCountryListPresenter.m
//  SampleProject0001
//
//  Created by MacMini7 on 12/29/15.
//  Copyright (c) 2015 MacMini7. All rights reserved.
//


#import "SelectedCountryListPresenter.h"

@interface SelectedCountryListPresenter ()

@property(nonatomic,weak) id <SelectedCountryListControllerCallBack>selectedCountryListController;
@end

@implementation SelectedCountryListPresenter



- (instancetype)initWithSelectedCountryListController:( id <SelectedCountryListControllerCallBack>)selectedCountryListController {
    
    
    if(self == [super init]) {
        
        _selectedCountryListController = selectedCountryListController;
        
    }
    
    return self;
}
#pragma mark -



-(void)loadContain:(NSArray *)contains {
    
    
    if(_selectedCountryListController && [_selectedCountryListController respondsToSelector:@selector(displayContent:)]) {
        
        [_selectedCountryListController displayContent:contains];
    }
}

@end
