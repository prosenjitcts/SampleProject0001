//
//  CountryListViewController.m
//  SampleProject0001
//
//  Created by MacMini7 on 12/28/15.
//  Copyright (c) 2015 MacMini7. All rights reserved.
//

#import "CountryListViewController.h"
#import "CountryListViewPresenter.h"
#import "Constants.h"
#import "SelectedCountryListController.h"

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
    
    _seletedCountries = [NSMutableArray array];
    self.countryListViewPresenter = [self countryListViewPresenter];
    [_countryListViewPresenter loadContent];
    [self addNavigationRightBarButton];
    [_countryListViewPresenter updateCountryCountLabel:self.seletedCountries ];
    [_countryListViewPresenter updateNextButtonState:self.seletedCountries ];
    
    
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
                                style:UIBarButtonItemStylePlain
                                target:self
                                action:@selector(clickedNext:)];
    
    self.navigationItem.rightBarButtonItem = btnSave;
}

- (void)isEnableNavRightBarButton:(BOOL)isEnabled {
    
    self.navigationItem.rightBarButtonItem.enabled = isEnabled;
}

#pragma mark Next Enent

- (void)clickedNext:(id)sender {
    
    
    SelectedCountryListController *selectedCountryListController = [self.storyboard instantiateViewControllerWithIdentifier:KEY_SB_ID_SCLController];

    selectedCountryListController.selectedCountryListContents = _seletedCountries;
    [self.navigationController pushViewController:selectedCountryListController animated:YES];
    
}

#pragma mark -


- (void)setSeletedCountries:(NSMutableArray *)seletedCountries {
    
    _seletedCountries = seletedCountries;
}

#pragma mark -  <CountryListViewControllerCallback>

- (void)displayContent:(NSArray *)contents {
  
    self.countryListContents = [contents ascendingSortedCountryByName];
    [tableViewCountryList reloadData];
    
}

- (void)didSelectAtIndexPath:(NSIndexPath *)indexPath
         selectedCountryDict:( NSDictionary *)selectedCountryDict withSelectionOperationType:(SelectionOperationType)selectionOperationType {
    
    if(!self.seletedCountries) return;
    
    switch (selectionOperationType) {
            
        case OperationTypeNoAction:
            
            break;
        case OperationTypeAdd:
            
            [self.seletedCountries addObject:selectedCountryDict];
            
            break;
        case OperationTypeRemove:
            
            [self.seletedCountries removeObject:selectedCountryDict];
            
            break;
            
        default:
            break;
    }
    
    
    [_countryListViewPresenter updateNextButtonState:self.seletedCountries ];
    [_countryListViewPresenter updateCountryCountLabel:self.seletedCountries ];
    
    [tableViewCountryList reloadData];
    
    
}

- (void)stateOfNextButton:(BOOL)isEnable {
    
    [self isEnableNavRightBarButton:isEnable];
    
}
- (void)updateSelectedCountryCountLabelText:(NSString *)selectedCountryCountLabelText
{
    
    lblSelectedCounrtyCount.text = selectedCountryCountLabelText;
    
}

#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.countryListContents  count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *dictCountry = [self selectedRowDictForIndexPath:indexPath];
    
    if(dictCountry) {
        
        NSString *countryName = [dictCountry objectForKey:KEY_COUNTRY_NAME];
        
        if(countryName.length)
            [cell textLabel].text = countryName;
    }
    BOOL isSelected = [_countryListViewPresenter isSelected:indexPath
                                         selectedDictionary:dictCountry
                                          selectedCountries:self.seletedCountries];
    
    
    cell.accessoryType = isSelected ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}



#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if(!self.seletedCountries) return;
    
    NSDictionary *dictCountry = [self selectedRowDictForIndexPath:indexPath];
    [_countryListViewPresenter didSelectAtIndexPath:indexPath selectedDictionary:dictCountry selectedCountries:self.seletedCountries];
    
}

#pragma mark -

- (NSDictionary *)selectedRowDictForIndexPath:(NSIndexPath *)indexPath {
    
  return  [_countryListViewPresenter selectedRowDictForIndexPath:indexPath
                                                   fromCountries:self.countryListContents];
    
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (void)dealloc {
    
    _seletedCountries = nil;
    _countryListViewPresenter = nil;
}
@end
