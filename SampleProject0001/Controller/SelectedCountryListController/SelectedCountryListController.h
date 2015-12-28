//
//  SelectedCountryListController.h
//  SampleProject0001
//
//  Created by MacMini7 on 12/28/15.
//  Copyright (c) 2015 MacMini7. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectedCountryListController : UIViewController
{
    
    __weak IBOutlet UITableView *selectedCountryTableView;
    
}
@property (nonatomic,strong) NSArray *selectedCountryListContents;
@end
