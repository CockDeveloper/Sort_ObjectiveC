//
//  NSObject+Sort.m
//  Sort
//
//  Created by Nguyễn Trọng Anh Tuấn on 23/10/2017.
//  Copyright © 2017 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "NSObject+Sort.h"
#import "NSMutableArray+Swap.h"

@implementation NSObject(Sort)

+ (void)sort:(NSMutableArray *)array  {
    [self selectionSort:array];
}

+ (void)selectionSort:(NSMutableArray *)a {
    NSInteger n = a.count;
    for (NSInteger i = 0; i < n - 1; ++i) { // We need to do n-2 passes
        if (![a[i] respondsToSelector:@selector(compare:)]) {
            break;
        }
        NSInteger iMin = i; //ith position: elements from i till n-1 are candidates
        for (NSInteger j = i + 1; j < n; ++j) {
            if ([a[j] compare:a[iMin]] == NSOrderedAscending) {
                iMin = j; // update the index of minimum element
            }
        }
        [a swap:i and:iMin];
    }
}

@end
