#import <Foundation/Foundation.h>
#import "Problem3.h"

@implementation DataProvider

- (void)fetchDataAndInvokeCompletion {
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));

    __weak typeof(self) weakSelf = self;
    dispatch_after(delayTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *responseData = [@"Sample data" dataUsingEncoding:NSUTF8StringEncoding];
        NSError *responseError = nil;

        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf.fetchDataCompletion) {
            strongSelf.fetchDataCompletion(responseData, responseError);
        }
    });
}

@end
