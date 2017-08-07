
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class SSKResponseObject,SSKUploadFileObject;

typedef void(^SuccessCallbackBlock)(SSKResponseObject *responseObject); /**< 请求成功, 返回响应数据, 执行成功回调操作 */
typedef void(^FailureCallbackBlock)(NSError *error);    /**< 请求失败, 返回失败原因, 执行失败回调操作 */

@protocol SSKWebserviceProtocal <NSObject>

@required


/**
 发送post请求

 @param url 请求目标地址
 @param params 请求参数
 @param success 请求成功回调操作
 @param failure 请求失败回调操作
 */
- (void)sendPost:(NSString *)url
          params:(NSDictionary *)params
         success:(SuccessCallbackBlock)success
         failure:(FailureCallbackBlock)failure;

- (void)sendGet:(NSString *)url
        params:(NSDictionary *)params
       success:(SuccessCallbackBlock)success
       failure:(FailureCallbackBlock)failure;


/**
 单文件上传
 
 @param url 接口地址
 @param params 参数
 @param file 文件data
 @param uploadProgress 上传进度
 @param success 成功操作回调
 @param failure 失败操作回调
 */
-(void)sendPost:(NSString *)url
         params:(NSDictionary *)params
           file:(SSKUploadFileObject *)file
       progress:(void(^)(NSProgress *uploadProgress))uploadProgress
        success:(SuccessCallbackBlock)success
        failure:(FailureCallbackBlock)failure;

/**
 多文件上传
 
 @param url 接口地址
 @param params 接口参数
 @param files 文件data列表
 @param uploadProgress 上传进度
 @param success 成功操作回调
 @param failure 失败操作回调
 */
- (void)sendPost:(NSString *)url
         params:(NSDictionary *)params
          files:(NSArray<SSKUploadFileObject *>*)files
        progress:(void(^)(NSProgress *uploadProgress))uploadProgress
        success:(SuccessCallbackBlock)success
        failure:(FailureCallbackBlock)failure;

@optional
/**
 判断网络连接状态
 
 @param strUrl 任意可访问的网络地址
 @return BOOL
 */
- (BOOL)netWorkReachabilityWithURLString:(NSString *) strUrl;

- (void)networkStatus;

- (void)configDefaultHost:(NSString *)defaultHost;

@end
