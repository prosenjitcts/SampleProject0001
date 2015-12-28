//
//  CountryListViewControllerCallback.h
//  SampleProject0001
//
//  Created by MacMini7 on 12/28/15.
//  Copyright (c) 2015 MacMini7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
@protocol CountryListViewControllerCallback <NSObject>

@optional
- (void)displayContent:(NSArray *)array;
- (void)willSelectionProcessed:(BOOL )willProcessed;

- (void)didSelectAtIndexPath:(NSIndexPath *)indexPath selectedCountryDict:( NSDictionary *)selectedCountryDict withSelectionOperationType:(SelectionOperationType)selectionOperationType;

- (void)stateOfNextButton:(BOOL)isEnable ;
- (void)updateSelectedCountryCountLabelText:(NSString *)selectedCountryCountLabelText ;

@end
