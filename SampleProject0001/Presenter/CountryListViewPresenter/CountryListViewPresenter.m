//
//  CountryListViewPresenter.m
//  SampleProject0001
//
//  Created by MacMini7 on 12/28/15.
//  Copyright (c) 2015 MacMini7. All rights reserved.
//
#import "Constants.h"
#import "CountryListViewPresenter.h"
#import "CountryListViewImpl.h"
@interface CountryListViewPresenter ()

@property(nonatomic,strong) CountryListViewImpl * countryListViewImpl;
@end

@implementation CountryListViewPresenter


#pragma mark - 
- (instancetype)initWithCountryListViewController:(id<CountryListViewControllerCallback>)countryListViewController {
    
    
    if (self = [super init])
    {
         _countryListViewController = countryListViewController;
        _countryListViewImpl = [[CountryListViewImpl alloc]initWithCountryListViewPresenter:self];
        
    }
    return self;
}

#pragma mark - 
- (void)loadContent{
    
    [_countryListViewImpl loadCountryListFromPlist];
}

- (void)displaycontent:(NSArray *)array{
    
    if(_countryListViewController
       && [_countryListViewController respondsToSelector:@selector(displayContent:)]) {
        
        [_countryListViewController displayContent:array];
    }
    
}
- (BOOL)willSelectionProcessed:(NSArray *)seletedCountries {
    
    BOOL isProcessed = NO;
    
    
    isProcessed = (seletedCountries &&
                   ![self isMaximumItemsSelected:seletedCountries] );
    
    
    if(_countryListViewController
       && [_countryListViewController respondsToSelector:@selector(willSelectionProcessed:)]) {
        
        [_countryListViewController willSelectionProcessed:isProcessed];
    }
    
    return isProcessed;
}


- (BOOL)isSelected:(NSIndexPath *)indexPath selectedDictionary:(NSDictionary *)dictCountry selectedCountries:(NSArray *)seletedCountries
{
    
    BOOL isSelected = NO;
    
    if(dictCountry && seletedCountries.count) {
        
        isSelected = [seletedCountries containsObject:dictCountry];
        
    }
    
    return isSelected;
}

- (void)didSelectAtIndexPath:(NSIndexPath *)indexPath selectedDictionary:(NSDictionary *)dictCountry selectedCountries:(NSArray *)seletedCountries
{
    
    if(!dictCountry || !seletedCountries || !indexPath)
    {
        if(_countryListViewController
           && [_countryListViewController respondsToSelector:@selector(didSelectAtIndexPath:selectedCountryDict:withSelectionOperationType:)] )
        {
            
            [_countryListViewController didSelectAtIndexPath:indexPath selectedCountryDict:dictCountry withSelectionOperationType:OperationTypeNoAction];
        }
        
        return;
    }
    
    
    BOOL isSelected = NO;
    
    if(dictCountry && seletedCountries.count) {
        isSelected = [seletedCountries containsObject:dictCountry];
        
    }
    BOOL isSelectionProced = [self willSelectionProcessed:seletedCountries];
    
    if(dictCountry && seletedCountries && indexPath )
    {
        if(!isSelected && isSelectionProced)
        {
            if(_countryListViewController
               && [_countryListViewController respondsToSelector:@selector(didSelectAtIndexPath:selectedCountryDict:withSelectionOperationType:)] )
            {
                
                [_countryListViewController didSelectAtIndexPath:indexPath selectedCountryDict:dictCountry withSelectionOperationType:OperationTypeAdd];
            }
        }
        
        else if(isSelected && seletedCountries.count>0 )
        {
            if(isSelectionProced)
            {
                if(_countryListViewController
                   && [_countryListViewController respondsToSelector:@selector(didSelectAtIndexPath:selectedCountryDict:withSelectionOperationType:)] )
                {
                    
                    [_countryListViewController didSelectAtIndexPath:indexPath selectedCountryDict:dictCountry withSelectionOperationType:OperationTypeRemove];
                }
            }
            else
            {
                if(_countryListViewController
                   && [_countryListViewController respondsToSelector:@selector(didSelectAtIndexPath:selectedCountryDict:withSelectionOperationType:)] )
                {
                    
                    [_countryListViewController didSelectAtIndexPath:indexPath selectedCountryDict:dictCountry withSelectionOperationType:OperationTypeRemove];
                }
            }
        }
    }
}

- (BOOL)updateNextButtonState:(NSArray *)selectedCountry {
    
    BOOL isEnable = [self isMinimumItemsSelected:selectedCountry];
    
    if(_countryListViewController
       && [_countryListViewController respondsToSelector:@selector(stateOfNextButton:)] )
    {
    
        [_countryListViewController stateOfNextButton:isEnable];
    
    }

    return isEnable;
}

- (NSString*)updateCountryCountLabel:(NSArray *)selectedCountries {
    
    NSString *text = (selectedCountries && selectedCountries.count) ? TEXT_WHEN_COUNTRY_SELECTED(selectedCountries.count):TEXT_WHEN_NO_COUNTRY_SELECTED;
    
    if(_countryListViewController && [_countryListViewController respondsToSelector:@selector(updateSelectedCountryCountLabelText:)]) {
        
        [_countryListViewController updateSelectedCountryCountLabelText:text];
    }
    
    return text;
}

- (NSDictionary *)selectedRowDictForIndexPath:(NSIndexPath *)indexPath fromCountries:(NSArray *)countries{
    
    if( !countries.count || !countries || !indexPath || indexPath.row >= countries.count) return nil;
    
    NSDictionary *dictCountry = [countries objectAtIndex:indexPath.row];
   
    return dictCountry;
    
}


#pragma mark - Selection Logic
- (BOOL)isMinimumItemsSelected:(NSArray *)selectedArray {
    
    BOOL isSuccess = (selectedArray && selectedArray.count >= NOS_MIN_SELECTION);
    
    return isSuccess;
    
}

- (BOOL)isMaximumItemsSelected:(NSArray *)selectedArray {
    
    BOOL isSuccess = (selectedArray && selectedArray.count >= NOS_MAX_SELECTION);
    
    return isSuccess;
    
}

- (void)dealloc {
    
    _countryListViewImpl = nil;
}
@end
