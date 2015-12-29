//
//  SelectedCountryListPresenter.h
//  SampleProject0001
//
//  Created by MacMini7 on 12/29/15.
//  Copyright (c) 2015 MacMini7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SelectedCountryListController.h"

@interface SelectedCountryListPresenter : NSObject

- (instancetype)initWithSelectedCountryListController:(id <SelectedCountryListControllerCallBack>)selectedCountryListController;
- (void)loadContain:(NSArray *)contains ;
@end
