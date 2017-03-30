
#import "SSKBaseWebservice.h"
#import "SSKWebserviceConfiguration.h"
#import "SSKSessionWebservice.h"

@interface SSKBaseWebservice ()

@property (nonatomic, strong) id<SSKWebserviceProtocal> delegate;
@property (nonatomic, copy) NSString *defaultHost;

@end

@implementation SSKBaseWebservice

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.delegate = [[SSKSessionWebservice alloc]init];
        self.defaultHost = SSK_HOST_URL;
    }
    return self;
}

- (instancetype)initWithWebserviceProtocal:(id<SSKWebserviceProtocal>)delegate
{
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.defaultHost = SSK_HOST_URL;
    }
    return self;
}

- (BOOL)netWorkReachabilityWithURLString:(NSString *)url
{
    return NO;
}

- (void)sendPost:(NSString *)url
          params:(NSDictionary *)params
         success:(successCallbackBlock)success
         failure:(failureCallbackBlock)failure
{
    [self.delegate sendPost:url params:params success:success failure:failure];
}

- (void)sendPostWithHost:(NSString *)hostUrl
                    path:(NSString *)path
                  params:(NSDictionary *)params
                 success:(successCallbackBlock)success
                 failure:(failureCallbackBlock)failure
{
    NSString *finalURL = [hostUrl stringByAppendingString:path];
    
    [self.delegate sendPost:finalURL params:params success:success failure:failure];
}

- (void)configDefaultHost:(NSString *)defaultHost
{
    self.defaultHost = [defaultHost copy];
}

- (void)sendPostWithPath:(NSString *)path params:(NSDictionary *)params success:(successCallbackBlock)success failure:(failureCallbackBlock)failure
{
    NSString *finalURL = [self.defaultHost stringByAppendingString:path];
    [self.delegate sendPost:finalURL params:params success:success failure:failure];
}

@end
