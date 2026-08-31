#import <Foundation/Foundation.h>
#import "Problem1.h"

@implementation CustomIntegerArray {
    NSMutableArray<NSNumber *> *_storage;
}

- (instancetype)initWithValues:(NSArray<NSNumber *> *)values {

    self = [super init];
    if (self) {
        _storage = [values mutableCopy] ?: [NSMutableArray array];
    }
    return self;
}

- (NSArray<NSNumber *> *)allValues {
    return [_storage copy];
}

- (CustomIntegerArray *)filter:(FilterPredicateBlock)block {
    NSMutableArray<NSNumber *> *result = [NSMutableArray array];
    for (NSNumber *num in _storage) {
        // Stores the integer value in result when the block returns YES.
        if (block([num integerValue])) {
            [result addObject:num];
        }
    }
    return [[CustomIntegerArray alloc] initWithValues:result];
}

- (NSInteger)reduce:(ReduceBlock)block withInitial:(NSInteger)initial {
    NSInteger result = initial;
    for (NSNumber *num in _storage) {
        result = block(result, [num integerValue]);
    }
    return result;
}

- (CustomIntegerArray *)sortedArrayUsingBlock:(ComparisonBlock)block {
    NSMutableArray<NSNumber *> *sorted = [_storage mutableCopy];
    NSInteger count = [sorted count];

    for (NSInteger i = 0; i < count; i++) {
        for (NSInteger j = 0; j < count - i - 1; j++) {
            NSNumber *left = sorted[j];
            NSNumber *right = sorted[j + 1];

            if (block([left integerValue], [right integerValue]) == NSOrderedDescending) {
                [sorted exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
            }
        }
    }

    return [[CustomIntegerArray alloc] initWithValues:sorted];
}

- (void)forEach:(ForEachBlock)block {
    for (NSNumber *num in _storage) {
        block([num integerValue]);
    }
}

- (NSString *)description {
    return [_storage description];
}
@end

/*
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
 */
