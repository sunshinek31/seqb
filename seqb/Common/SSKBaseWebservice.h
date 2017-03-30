

#import <Foundation/Foundation.h>
#import "SSKWebserviceProtocal.h"

@interface SSKBaseWebservice : NSObject

- (instancetype)initWithWebserviceProtocal:(id<SSKWebserviceProtocal> )delegate;

- (BOOL)netWorkReachabilityWithURLString:(NSString *)url;

- (void)configDefaultHost:(NSString *)defaultHost;

- (void)sendPost:(NSString *)url
          params:(NSDictionary *)params
         success:(successCallbackBlock)success
         failure:(failureCallbackBlock)failure;

- (void)sendPostWithHost:(NSString *)hostUrl
                    path:(NSString *)path
                  params:(NSDictionary *)params
                 success:(successCallbackBlock)success
                 failure:(failureCallbackBlock)failure;

- (void)sendPostWithPath:(NSString *)path
                  params:(NSDictionary *)params
                 success:(successCallbackBlock)success
                 failure:(failureCallbackBlock)failure;

@end
