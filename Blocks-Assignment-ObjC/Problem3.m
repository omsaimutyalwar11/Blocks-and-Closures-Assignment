#import <Foundation/Foundation.h>
#import "Problem3.h"

@implementation DataProvider

// Why the property must be copy?
// -->
// Blocks are created on the stack by default. Without copy, the block would be deallocated
// when it goes out of scope, even though it's stored in the property. By using copy,
// the block is copied to the heap, ensuring it persists and can be safely invoked later.

- (void)fetchDataAndInvokeCompletion {
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));

    dispatch_after(delayTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *responseData = [@"Sample data" dataUsingEncoding:NSUTF8StringEncoding];
        NSError *responseError = nil;

        // Call the completion block.
        if (self.fetchDataCompletion) {
            self.fetchDataCompletion(responseData, responseError);
        }
    });
}

@end
