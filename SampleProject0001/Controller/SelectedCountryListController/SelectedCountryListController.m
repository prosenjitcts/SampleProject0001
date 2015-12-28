//
//  SelectedCountryListController.m
//  SampleProject0001
//
//  Created by MacMini7 on 12/28/15.
//  Copyright (c) 2015 MacMini7. All rights reserved.
//

#import "SelectedCountryListController.h"
#import "Constants.h"
@implementation SelectedCountryListController
#pragma mark - UITableView DataSource

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setSelectedCountryListContents:(NSArray *)selectedCountryListContents{
    _selectedCountryListContents = selectedCountryListContents;
    [selectedCountryTableView reloadData];

}

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
}
@end
