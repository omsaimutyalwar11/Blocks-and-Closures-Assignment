//
//  main.m
//  Blocks-Assignment-ObjC
//
//  Created by Omsai Mutyalwar on 26/08/26.
//

#import <Foundation/Foundation.h>
#import "Problem1.h"
#import "Problem3.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Code that calls the above implememented functions
        CustomIntegerArray *numbers = [[CustomIntegerArray alloc] initWithValues:@[@5, @2,
                                                                                   @8, @1, @9, @3]];
        // 1. filter:
        CustomIntegerArray *evens = [numbers filter:^BOOL(NSInteger value) {
            return value % 2 == 0;
        }];
        NSLog(@"Evens: %@", evens);
        // Prints:
        // Evens: (
        // 2,
        // 8
        // )

        // 2. reduce:withInitial:
        NSInteger sum = [numbers reduce:^NSInteger(NSInteger partial, NSInteger value) {
            return partial + value;
        } withInitial:0];
        NSLog(@"Sum: %ld", (long)sum); // Prints: Sum: 28

        // 3. sortedArrayUsingBlock:
        CustomIntegerArray *sorted = [numbers
                                      sortedArrayUsingBlock:^NSComparisonResult(NSInteger a, NSInteger b) {
            if (a < b) return NSOrderedAscending;
            if (a > b) return NSOrderedDescending;
            return NSOrderedSame;
        }];
        NSLog(@"Sorted: %@", sorted);
        // Prints:
        // Sorted: (
        // 1,
        // 2,
        // 3,
        // 5,
        // 8,
        // 9
        // )

        // 4. forEach:
        [numbers forEach:^(NSInteger value) {
            NSLog(@"Value: %ld", (long)value);
        }];
        // Prints:
        // Value: 5
        // Value: 2
        // Value: 8
        // Value: 1
        // Value: 9
        // Value: 3
    }
    return 0;
}
