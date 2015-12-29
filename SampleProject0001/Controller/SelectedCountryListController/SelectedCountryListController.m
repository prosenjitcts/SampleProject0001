//
//  SelectedCountryListController.m
//  SampleProject0001
//
//  Created by MacMini7 on 12/28/15.
//  Copyright (c) 2015 MacMini7. All rights reserved.
//

#import "SelectedCountryListController.h"
#import "Constants.h"
#import "SelectedCountryListPresenter.h"

@interface SelectedCountryListController ()

@property(nonatomic,strong) SelectedCountryListPresenter *selectedCountryListPresenter;
@end

@implementation SelectedCountryListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SelectedCountryListPresenter
- (SelectedCountryListPresenter*)selectedCountryListPresenter {
    
    if(!_selectedCountryListPresenter) {
        _selectedCountryListPresenter = [[SelectedCountryListPresenter alloc]initWithSelectedCountryListController:self];
    }
    
    return _selectedCountryListPresenter;
}

#pragma mark - Call Back  <SelectedCountryListControllerCallBack>
- (void)displayContent:(NSArray *)array {
    
    [selectedCountryTableView reloadData];
    
}

#pragma mark - Setter Method
-(void)setSelectedCountryListContents:(NSArray *)selectedCountryListContents{
   
    _selectedCountryListContents = selectedCountryListContents;
  
    [self.selectedCountryListPresenter loadContain:_selectedCountryListContents];
    
}

#pragma mark -  Table View Data Source <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.selectedCountryListContents  count];
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
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (NSDictionary *)selectedRowDictForIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.row >= self.selectedCountryListContents.count) return nil;
    
    NSDictionary *dictCountry = [self.selectedCountryListContents objectAtIndex:indexPath.row];
    return dictCountry;
    
}
#pragma mark - Release Memory
-(void)dealloc {
    
    _selectedCountryListContents = nil;
    _selectedCountryListPresenter = nil;
}
@end
