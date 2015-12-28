//
//  CountryListViewController.h
//  SampleProject0001
//
//  Created by MacMini7 on 12/28/15.
//  Copyright (c) 2015 MacMini7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountryListViewControllerCallback.h"

@interface CountryListViewController : UIViewController<CountryListViewControllerCallback>{
    
    
    __weak IBOutlet UILabel *lblSelectedCounrtyCount;
    __weak IBOutlet UITableView *tableViewContryList;
    
}
@property (nonatomic, strong) NSArray *contryListContents;



@end
