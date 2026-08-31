// Objective C - Problem statement 2

@class NetworkClient;

@interface DownloadViewController : NSObject

@property (nonatomic, strong) NetworkClient *networkClient;
@property (nonatomic, copy) dispatch_block_t completionBlock;

@end
