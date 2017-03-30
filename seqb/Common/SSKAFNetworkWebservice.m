
#import "SSKAFNetworkWebservice.h"
#import "SSKWebserviceConfiguration.h"
#import "AFNetworking.h"

@interface SSKAFNetworkWebservice ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic, strong) NSURLSessionConfiguration *sessionConfig;
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSMutableURLRequest *request;
@property (nonatomic, strong) NSURLSessionDataTask *postDataTask;
@end

@implementation SSKAFNetworkWebservice

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)configDefaultHost:(NSString *)defaultHost
{
    
}

- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
        
        _manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        _manager.requestSerializer.timeoutInterval = SSKTimeoutIntervalForRequest;
        [_manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/javascript",@"text/plain", nil];
        
        [self configSessionManagerHeader:_manager];
    }
    return _manager;
}

- (void)configSessionManagerHeader:(AFHTTPSessionManager *)manager
{
    
}


-(void)sendPost:(NSString *)url
         params:(NSDictionary *)params
        success:(successCallbackBlock)success
        failure:(failureCallbackBlock)failure
{
    
    [self.manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        !success ? :success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        !failure ? :failure(error);
    }];
    
}

@end
