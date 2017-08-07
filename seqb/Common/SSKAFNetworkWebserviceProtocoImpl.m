//
//  SSKAFNetworkWebserviceProtocoImpl.m
//  seqb
//
//  Created by sunshinek31 on 2017/8/7.
//  Copyright © 2017年 sunshinek31. All rights reserved.
//

#import "SSKAFNetworkWebserviceProtocoImpl.h"
#import "AFNetworking.h"
#import <MJExtension/MJExtension.h>
#import "SSKResponseObject.h"
#import "SSKUploadFileObject.h"

@interface SSKAFNetworkWebserviceProtocoImpl()
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic, strong) NSURLSessionConfiguration *sessionConfig;
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSMutableURLRequest *request;
@property (nonatomic, strong) NSURLSessionDataTask *postDataTask;
@end

@implementation SSKAFNetworkWebserviceProtocoImpl

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

#pragma mark - delegate

- (void)configDefaultHost:(NSString *)defaultHost {
    
}

- (void)sendGet:(NSString *)url
         params:(NSDictionary *)params
        success:(SuccessCallbackBlock)success
        failure:(FailureCallbackBlock)failure
{
    __weak typeof(self) weakSelf = self;
    
    [self.manager GET:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [weakSelf handleRequestSuccess:responseObject success:success failure:failure];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        !failure ? :failure(error);
    }];
}

- (void)sendPost:(NSString *)url
          params:(NSDictionary *)params
            file:(SSKUploadFileObject *)file
        progress:(void(^)(NSProgress *uploadProgress))uploadPro
         success:(SuccessCallbackBlock)success
         failure:(FailureCallbackBlock)failure
{
    __weak typeof(self) weakSelf = self;
    
    [self.manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        if (file) {
            
            [formData appendPartWithFileData:file.data name:file.name fileName:file.filename mimeType:file.mimetype];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (uploadPro) {
            uploadPro(uploadProgress);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [weakSelf handleRequestSuccess:responseObject success:success failure:failure];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !failure ? :failure(error);
    }];
}

- (void)sendPost:(NSString *)url
          params:(NSDictionary *)params
           files:(NSArray<SSKUploadFileObject *> *)files
        progress:(void(^)(NSProgress *uploadProgress))uploadPro
         success:(SuccessCallbackBlock)success
         failure:(FailureCallbackBlock)failure
{
    __weak typeof(self) weakSelf = self;
    
    [self.manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        if (files) {
            
            for (SSKUploadFileObject *uploadFileObject in files) {
                if ([uploadFileObject isValid]) {
                    [formData appendPartWithFileData:uploadFileObject.data name:uploadFileObject.name fileName:uploadFileObject.filename mimeType:uploadFileObject.mimetype];
                }
            }
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (uploadPro) {
            uploadPro(uploadProgress);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [weakSelf handleRequestSuccess:responseObject success:success failure:failure];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !failure ? :failure(error);
    }];
}

- (void)sendPost:(NSString *)url
          params:(NSDictionary *)params
         success:(SuccessCallbackBlock)success
         failure:(FailureCallbackBlock)failure
{
    __weak typeof(self) weakSelf = self;
    
    [self.manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [weakSelf handleRequestSuccess:responseObject success:success failure:failure];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        !failure ? :failure(error);
    }];
}

#pragma mark - parse

// 将所有request成功回调 统一在该方法中处理;
- (void)handleRequestSuccess:(id  _Nullable )responseObject
                     success:(SuccessCallbackBlock)success
                     failure:(FailureCallbackBlock)failure
{
    NSError *error;
    NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:&error];
    NSString *responseString = nil;
    if (error.code == 3840){
        responseString = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        debugLog(@"%@",responseString);
        
        if (failure) {
            !failure?:failure(error);
        }
        
        return;
    }
    
    SSKResponseObject *responseObj = [SSKResponseObject mj_objectWithKeyValues:response];
    if (success) {
        success(responseObj);
    }
}

@end
