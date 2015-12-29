//
//  NSArray+SortedArray.h
//  SampleProject0001
//
//  Created by MacMini7 on 12/29/15.
//  Copyright (c) 2015 MacMini7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SortedArray)
- (NSArray *)ascendingSortedCountryByName;
- (NSArray *)sortedArrayWithKey:(NSString *)key ascending:(BOOL)ascending;
@end
