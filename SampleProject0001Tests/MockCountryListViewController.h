//
//  MockCountryListViewController.h
//  SampleProject0001
//
//  Created by MacMini7 on 12/28/15.
//  Copyright (c) 2015 MacMini7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CountryListViewControllerCallback.h"
@interface MockCountryListViewController : NSObject<CountryListViewControllerCallback>
@property (nonatomic, strong) NSArray *contryListContents;

@end
