//
//  CountryListViewController.m
//  SampleProject0001
//
//  Created by MacMini7 on 12/28/15.
//  Copyright (c) 2015 MacMini7. All rights reserved.
//

#import "CountryListViewController.h"
#import "CountryListViewPresenter.h"
@interface CountryListViewController () {
    UIBarButtonItem *rightBarButtonItem;
}

@property (nonatomic, strong) CountryListViewPresenter *countryListViewPresenter;
@property (nonatomic, strong) NSMutableArray *seletedCountries;

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


#pragma mark -  Navigation RightBarButton

- (void)addNavigationRightBarButton{
    UIBarButtonItem *btnSave = [[UIBarButtonItem alloc]
                                initWithTitle:@"Next"
                                style:UIBarButtonItemStyleDone
                                target:self
                                action:@selector(clickedNext:)];
  
    self.navigationItem.rightBarButtonItem = btnSave;
}

- (void)isEnableNavRightBarButton:(BOOL)isEnabled {
    
    self.navigationItem.rightBarButtonItem.enabled = isEnabled;
}

#pragma mark Enent 

- (void)clickedNext:(id)sender {
    
    
}

#pragma mark -

- (NSMutableArray *)contryListContents {
    
    if(!_seletedCountries) {
        
        _seletedCountries = [NSMutableArray array];
    }
    return _seletedCountries;
}

- (void)setSeletedCountries:(NSMutableArray *)seletedCountries {
    
    _seletedCountries = seletedCountries;
    
    
    
}



#pragma mark -  <CountryListViewControllerCallback>

- (void)displayContent:(NSArray *)array {
    
    self.contryListContents = array;
    
    [tableViewContryList reloadData];

}

#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contryListContents  count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"ListCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSString *countryName = [self.contryListContents objectAtIndex:indexPath.row];
    
    if(countryName.length)
        [cell textLabel].text = countryName;
    
    return cell;
}



#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    

}


#pragma <#arguments#>
#pragma mark -  Relesae Memory
- (void)dealloc {
    
    _contryListContents = nil;
    _seletedCountries = nil;

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
