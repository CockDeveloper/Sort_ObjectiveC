//
//  NSMutableArray+Swap.m
//  Sort
//
//  Created by Nguyễn Trọng Anh Tuấn on 23/10/2017.
//  Copyright © 2017 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "NSMutableArray+Swap.h"

@implementation NSMutableArray(Swap)

- (void)swap:(NSUInteger)indexFirst and:(NSUInteger)indexSecond {
    // swap 01
    //        id temp = self[i];
    //        self[i] = self[iMin];
    //        self[iMin] = temp;
    
    // swap 02
    //        NSUInteger iMin = MIN(indexFirst, indexSecond);
    //        NSUInteger iMax = MIN(indexFirst, indexSecond);
    //        id objectAfter = [self objectAtIndex:iMax];
    //        [self removeObjectAtIndex:iMax];
    //        id objectBefore = [self objectAtIndex:i];
    //        [self insertObject:objectBefore atIndex:iMin];
    //        [self removeObjectAtIndex:i];
    //        [self insertObject:objectAfter atIndex:i];
    
    // swap 03
    [self exchangeObjectAtIndex:indexFirst withObjectAtIndex:indexSecond];
}

@end
