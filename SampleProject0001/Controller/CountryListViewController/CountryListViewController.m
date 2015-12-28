//
//  CountryListViewController.m
//  SampleProject0001
//
//  Created by MacMini7 on 12/28/15.
//  Copyright (c) 2015 MacMini7. All rights reserved.
//

#import "CountryListViewController.h"
#import "CountryListViewPresenter.h"
@interface CountryListViewController ()<CountryListViewControllerCallback>
@property (nonatomic, strong) CountryListViewPresenter *countryListViewPresenter;
@property (nonatomic, strong) NSArray *countryListcontents;
@end

@implementation CountryListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.countryListViewPresenter = [self countryListViewPresenter];
    [_countryListViewPresenter loadContent];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 

- (CountryListViewPresenter *)countryListViewPresenter {
   
    CountryListViewPresenter * countryListViewPresenter = [[CountryListViewPresenter alloc]initWithCountryListViewController:self];
    
    return countryListViewPresenter;
    
}


#pragma mark -  <CountryListViewControllerCallback>

- (void)displayContent:(NSArray *)array {
    
    
    self.countryListcontents = array;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
