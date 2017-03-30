
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^successCallbackBlock)(id responseObject); /**< 请求成功, 返回响应数据, 执行成功回调操作 */
typedef void(^failureCallbackBlock)(NSError *error);    /**< 请求失败, 返回失败原因, 执行失败回调操作 */

@protocol SSKWebserviceProtocal <NSObject>

@required

- (void)configDefaultHost:(NSString *)defaultHost;

- (void)sendPost:(NSString *)url
          params:(NSDictionary *)params
         success:(successCallbackBlock)success
         failure:(failureCallbackBlock)failure;


@optional
/**
 判断网络连接状态

 @param strUrl 任意可访问的网络地址
 @return BOOL
 */
- (BOOL)netWorkReachabilityWithURLString:(NSString *) strUrl;

- (void)networkStatus;

@end
