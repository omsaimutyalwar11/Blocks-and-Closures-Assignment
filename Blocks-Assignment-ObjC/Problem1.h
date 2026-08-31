// Objective C - Problem statement 1
// CustomIntegerArray.h

typedef BOOL (^FilterPredicateBlock)(NSInteger value);
typedef NSInteger (^ReduceBlock)(NSInteger partial, NSInteger value);
typedef NSComparisonResult (^ComparisonBlock)(NSInteger a, NSInteger b);
typedef void (^ForEachBlock)(NSInteger value);

@interface CustomIntegerArray : NSObject

- (instancetype)initWithValues:(NSArray<NSNumber *> *)values
NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

- (CustomIntegerArray *)filter:(nonnull FilterPredicateBlock)block;
- (NSInteger)reduce:(nonnull ReduceBlock)block withInitial:(NSInteger)initial;
- (CustomIntegerArray *)sortedArrayUsingBlock:(nonnull ComparisonBlock)block;
- (void)forEach:(nonnull ForEachBlock)block;

@end
