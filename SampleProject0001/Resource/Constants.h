//
//  Constants.h
//  SampleProject0001
//
//  Created by MacMini7 on 12/28/15.
//  Copyright (c) 2015 MacMini7. All rights reserved.
//

#import <Foundation/Foundation.h>
// Declear Header File
#import "NSArray+SortedArray.h"


typedef NS_ENUM(NSUInteger, SelectionOperationType) {
    OperationTypeNoAction = 1,
    OperationTypeAdd ,
    OperationTypeRemove,
};

#define NOS_MIN_SELECTION 3
#define NOS_MAX_SELECTION 10

#define KEY_COUNTRY_ID @"kCountryID"
#define KEY_COUNTRY_NAME @"kCountryName"

#define KEY_SB_ID_SCLController @"SelectedCountryListController"

