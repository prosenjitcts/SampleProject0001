//
//  NSArray+SortedArray.m
//  SampleProject0001
//
//  Created by MacMini7 on 12/29/15.
//  Copyright (c) 2015 MacMini7. All rights reserved.
//

#import "NSArray+SortedArray.h"
#import "Constants.h"
@implementation NSArray (SortedArray)
- (NSArray *)ascendingSortedCountryByName{
    
    return  [self sortedArrayWithKey:KEY_COUNTRY_NAME ascending:YES];
}
- (NSArray *)sortedArrayWithKey:(NSString *)key ascending:(BOOL)ascending{
    
    NSSortDescriptor *sorter = [[NSSortDescriptor alloc]
                                initWithKey:KEY_COUNTRY_NAME
                                ascending:ascending
                                selector:@selector(localizedCaseInsensitiveCompare:)];
    NSArray *sortDescriptors = [NSArray arrayWithObject: sorter];
    
    
    return  [self sortedArrayUsingDescriptors:sortDescriptors];
}
@end
