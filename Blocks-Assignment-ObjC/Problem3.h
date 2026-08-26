// Objective C - Problem statment 3

// The property must be copy because blocks are created on the stack by default.
// If we only use strong, the block could be deallocated before it's executed.
// Using copy ensures the block is copied to the heap, making it safe to use later.
typedef void (^FetchDataCompletion)(NSData *_Nullable data, NSError *_Nullable error);

@interface DataProvider : NSObject

@property (nonatomic, copy) FetchDataCompletion _Nullable fetchDataCompletion;

- (void)fetchDataAndInvokeCompletion;

@end
