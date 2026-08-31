// Objective C - Problem statment 3

// Why the property must be copy?

// A block is often created on the stack first. If that block is used after the current scope ends,
// it must be moved to the heap so it remains valid.
// `copy` documents the intent that this escaping block must live on the heap and be retained beyond the current frame.
//
// This is especially important under MRC: if a stack block is stored in a property without copying,
// the underlying block can outlive the stack frame it was created on and become a dangling pointer.
// In that case, calling it later may crash or behave unpredictably.
//
// Under ARC, assigning a block to a strong property still triggers a copy to the heap automatically,
// so `strong` is functionally safe in this specific case. However, `copy` is still the more explicit
// and semantically correct choice for an escaping block property because it communicates the lifetime
// requirement clearly and preserves the correct behavior.
typedef void (^FetchDataCompletion)(NSData *_Nullable data, NSError *_Nullable error);

@interface DataProvider : NSObject

@property (nonatomic, copy) FetchDataCompletion _Nullable fetchDataCompletion;

- (void)fetchDataAndInvokeCompletion;

@end
