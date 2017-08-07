

#import <Foundation/Foundation.h>
#import "SSKWebserviceConfiguration.h"
#import "SSKWebserviceProtocal.h"
#import "SSKWebserviceRequestURLString.h"
#import "SSKWebserviceRequestURLStringContext.h"

static NSString *SSKWebserviceDefaultHost = SSK_HOST_URL;

@interface SSKBaseWebservice : NSObject

- (instancetype)initWithDefaultHost;
- (instancetype)initWithCustomHost:(NSString *)customHost;
- (BOOL)netWorkReachabilityWithURLString:(NSString *)url;
- (void)configDefaultHost:(NSString *)defaultHost;


/**
 post请求

 @param urlContext 完整接口地址
 @param params 参数
 @param success 成功回调
 @param failure 失败回调
 */
- (void)sendPost:(SSKWebserviceRequestURLStringContext *)urlContext
          params:(NSDictionary *)params
         success:(SuccessCallbackBlock)success
         failure:(FailureCallbackBlock)failure;


/**
 post自定义路径请求(单文件上传)

 @param urlContext 接口地址封装
 @param params 参数
 @param uploadFile 上传文件
 @param uploadProgress 上传进度
 @param success 成功回调
 @param failure 失败回调
 */
- (void)sendPost:(SSKWebserviceRequestURLStringContext *)urlContext
          params:(NSDictionary *)params
            file:(SSKUploadFileObject *)uploadFile
        progress:(void(^)(NSProgress *progress))uploadProgress
         success:(SuccessCallbackBlock)success
         failure:(FailureCallbackBlock)failure;


/**
 post自定义路径请求(多文件上传)

 @param urlContext 接口地址封装
 @param params 参数
 @param uploadFiles 上传文件列表
 @param uploadProgress 上传进度
 @param success 成功回调
 @param failure 失败回调
 */
- (void)sendPost:(SSKWebserviceRequestURLStringContext *)urlContext
          params:(NSDictionary *)params
           files:(NSArray<SSKUploadFileObject *> *)uploadFiles
        progress:(void(^)(NSProgress *progress))uploadProgress
         success:(SuccessCallbackBlock)success
         failure:(FailureCallbackBlock)failure;

@end
