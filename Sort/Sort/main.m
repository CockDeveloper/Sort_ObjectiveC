//
//  main.m
//  Sort
//
//  Created by Nguyễn Trọng Anh Tuấn on 22/10/2017.
//  Copyright © 2017 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Sort.h"
#import "NSArray+DumpConsole.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
//        NSLog(@"Selection Sort");insertionSort
//        NSLog(@"Buble Sort");
//        NSLog(@"Insertion Sort");
//        NSLog(@"Merge Sort");
        NSLog(@"Quick Sort");
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@3, @20, @4, @9, @7, @4, @5, @10, nil];
        [NSObject sort:array];
        [array print];
    }
    return 0;
}
