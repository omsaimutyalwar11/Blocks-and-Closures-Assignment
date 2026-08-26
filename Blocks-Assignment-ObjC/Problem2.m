#import <Foundation/Foundation.h>
#import "Problem2.h"
#import "NetworkClient.h"

@implementation DownloadViewController

- (void)startDownload {
    __weak typeof(self) weakSelf = self;
    [self.networkClient fetchDataWithCompletion:^{
        __strong typeof(self) strongSelf = weakSelf;

        if (!strongSelf) {
            return;
        }

        __weak typeof(strongSelf) weakInnerSelf = strongSelf;
        strongSelf.completionBlock = ^{
            __strong typeof(weakInnerSelf) strongInnerSelf = weakInnerSelf;

            if (!strongInnerSelf) {
                return;
            }

            [strongInnerSelf updateUI];
        };
    }];
    /*
     Explaination:

     Issue:
     The inner block assigned to `completionBlock` captures `strongSelf`, which creates a retain cycle. The `DownloadViewController` retains the block, and the block retains `strongSelf`, preventing both from being deallocated.

     Fix:
     Use the weak/strong pattern in the inner block:
     - Create weakInnerSelf pointing to strongSelf (weak reference).
     - In the inner block, convert it back to strongInnerSelf (strong reference).
     - This breaks the retain cycle because the stored block now only weakly references self.

     Whether the outer weakSelf / strongSelf pattern is itself a problem?

     --> No, it is NOT a problem. The outer weakSelf / strongSelf pattern is correct. It prevents a retain cycle between the `DownloadViewController` and the block passed to `fetchDataWithCompletion`. The outer block does not create a retain cycle because it does not store the block, it only executes it once.
     --> The issue is only with the inner block which gets stored as a property, requiring its own weak/strong pattern.
     */
}

- (void)updateUI {
    NSLog(@"Updating UI");
}

@end
