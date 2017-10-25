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
//    [self selectionSort:array];
//    [self bubbleSort:array];
//    [self insertionSort:array];
//    [self mergeSort:array];
    [self quickSort:array];
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

+ (void)bubbleSort:(NSMutableArray *)a {
    NSInteger n = a.count;
    for (NSInteger k = 1; k < n; ++k) { // We need to do n-2 passes
        if (![a[k] respondsToSelector:@selector(compare:)]) {
            break;
        }
        BOOL wasSorted = YES;
        for (NSInteger i = 0; i < n - k; ++i) {
            if ([a[i + 1] compare:a[i]] == NSOrderedAscending) {
                wasSorted = NO;
                [a swap:i and:(i + 1)];
            }
        }
        if (wasSorted) {
            break;
        }
    }
}

+ (void)insertionSort:(NSMutableArray *)a {
    NSInteger n = a.count;
    for (NSInteger i = 1; i < n; ++i) { // We need to do n-2 passes
        if (![a[i] respondsToSelector:@selector(compare:)]) {
            break;
        }
        id value = a[i];
        NSInteger hole = i;
        while (hole > 0 && [value compare:a[hole - 1]] == NSOrderedAscending) {
            a[hole] = a[hole - 1];
            --hole;
        }
        a[hole] = value;
    }
}

#pragma mark - Merge Sort
+ (void)merge:(NSUInteger)sL eL:(NSUInteger)eL
           sR:(NSUInteger)sR eR:(NSUInteger)eR
        array:(NSMutableArray *)a {
    if (eL + 1 == sR) {
        NSInteger nL = eL - sL + 1;
        NSInteger nR = eR - sR + 1;
        
        if (nL > 0 && nR > 0) {
            NSUInteger i = 0, j = 0;
            //        NSUInteger k = 0; not need use
            NSMutableArray *aTemp = [NSMutableArray new];
            while (i < nL && j < nR) {
                if (![a[sL + i] respondsToSelector:@selector(compare:)]) {
                    break;
                }
                if (![a[sR + j] respondsToSelector:@selector(compare:)]) {
                    break;
                }
                
                if ([a[sR + j] compare:a[sL + i]] != NSOrderedAscending) {
                    [aTemp addObject:a[sL + i]];
                    //                ++k;
                    ++i;
                }
                else {
                    [aTemp addObject:a[sR + j]];
                    //                ++k;
                    ++j;
                }
            }
            
            while (i < nL) {
                [aTemp addObject:a[sL + i]];
                ++i;
                //            ++k;
            }
            while (j < nR) {
                [aTemp addObject:a[sR + j]];
                ++j;
                //            ++k;
            }
            
            NSRange range = NSMakeRange(sL, nL + nR);
            [a replaceObjectsInRange:range withObjectsFromArray:aTemp];
        }
    }
}

+ (void)mergeSort:(NSMutableArray *)a {
    [self mergeSort:a withStart:0 andEnd:a.count - 1];
}

+ (void)mergeSort:(NSMutableArray *)a withStart:(NSUInteger)s andEnd:(NSUInteger)e {
    NSInteger n = e - s + 1;
    if (n >= 2) {
        NSUInteger mid = n/2;
        NSUInteger sL = s;
        NSUInteger eL = s + mid - 1;
        NSUInteger sR = s + mid;
        NSUInteger eR = e;
        
        [self mergeSort:a withStart:sL andEnd:eL];
        [self mergeSort:a withStart:sR andEnd:eR];
        [self merge:sL eL:eL
                 sR:sR eR:eR
              array:a];
    }
}

#pragma mark - Quick Sort
+ (void)quickSort:(NSMutableArray *)a {
    [self quickSort:a withStart:0 andEnd:a.count - 1];
}

+ (void)quickSort:(NSMutableArray *)a
        withStart:(NSUInteger)s andEnd:(NSUInteger)e {
    if (s < e) {
        NSUInteger pIndex = [self partition:a withStart:s andEnd:e];
        [self quickSort:a withStart:s andEnd:pIndex - 1];
        [self quickSort:a withStart:pIndex + 1 andEnd:e];
    }
}

+ (NSUInteger)partition:(NSMutableArray *)a
        withStart:(NSUInteger)s andEnd:(NSUInteger)e {
    NSUInteger pIndex = s;
    id pivot = a[e];
    for (NSUInteger i = s; i < e; ++i) {
        if (![a[i] respondsToSelector:@selector(compare:)]) {
            break;
        }
        if ([pivot compare:a[i]] != NSOrderedAscending) {
            [a swap:pIndex and:i];
            ++pIndex;
        }
    }
    [a swap:pIndex and:e];
    return pIndex;
}

@end
