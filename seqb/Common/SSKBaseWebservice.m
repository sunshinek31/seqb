
#import "SSKBaseWebservice.h"
#import "SSKAFNetworkWebserviceProtocoImpl.h"

@interface SSKBaseWebservice ()

@property (nonatomic) id<SSKWebserviceProtocal> delegate;
@property (nonatomic, copy) NSString *defaultHost;

@end

@implementation SSKBaseWebservice

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.delegate = [[SSKAFNetworkWebserviceProtocoImpl alloc]init];
        _defaultHost = SSKWebserviceDefaultHost;
    }
    return self;
}

- (instancetype)initWithWebserviceProtocal:(id<SSKWebserviceProtocal>)delegate
{
    self = [super init];
    if (self) {
        self.delegate = delegate;
        _defaultHost = SSKWebserviceDefaultHost;
    }
    return self;
}

- (instancetype)initWithDefaultHost
{
    self = [super init];
    if (self) {
        self.delegate = [[SSKAFNetworkWebserviceProtocoImpl alloc]init];
        _defaultHost = SSKWebserviceDefaultHost;
    }
    return self;
}

- (instancetype)initWithCustomHost:(NSString *)customHost
{
    self = [super init];
    if (self) {
        self.delegate = [[SSKAFNetworkWebserviceProtocoImpl alloc]init];
        _defaultHost = customHost;
    }
    return self;
}


- (void)configDefaultHost:(NSString *)defaultHost
{
    _defaultHost = [defaultHost copy];
}

- (BOOL)netWorkReachabilityWithURLString:(NSString *)url
{
    return NO;
}

#pragma mark -
// post请求
- (void)sendPost:(SSKWebserviceRequestURLStringContext *)urlContext
          params:(NSDictionary *)params
         success:(SuccessCallbackBlock)success
         failure:(FailureCallbackBlock)failure
{
    NSString *finalURL = [self.defaultHost stringByAppendingString:urlContext.URLString];
    [self.delegate sendPost:finalURL params:params success:success failure:failure];
}

// post请求
// 单文件上传
- (void)sendPost:(SSKWebserviceRequestURLStringContext *)urlContext
          params:(NSDictionary *)params
            file:(SSKUploadFileObject *)uploadFile
        progress:(void (^)(NSProgress *))uploadProgress
         success:(SuccessCallbackBlock)success
         failure:(FailureCallbackBlock)failure
{
    NSString *finalURL = [self.defaultHost stringByAppendingString:urlContext.URLString];
    [self.delegate sendPost:finalURL params:params file:uploadFile progress:uploadProgress success:success failure:failure];
}

// post请求
// 多文件上传
- (void)sendPost:(SSKWebserviceRequestURLStringContext *)urlContext
          params:(NSDictionary *)params
           files:(NSArray<SSKUploadFileObject *> *)uploadFiles
        progress:(void (^)(NSProgress *))uploadProgress
         success:(SuccessCallbackBlock)success
         failure:(FailureCallbackBlock)failure
{
    NSString *finalURL = [self.defaultHost stringByAppendingString:urlContext.URLString];
    [self.delegate sendPost:finalURL params:params files:uploadFiles progress:uploadProgress success:success failure:failure];
}

@end
