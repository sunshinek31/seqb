//
//  SSKUploadFileObject.h
//  seqb
//
//  Created by sunshinek31 on 2017/5/1.
//  Copyright © 2017年 sunshinek31. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSKUploadFileObject : NSObject
@property (nonatomic, strong) NSString *name;       /**< 文件名 */
@property (nonatomic, strong) NSString *filename;   /**< 文件放入文件夹后名字 */
@property (nonatomic, strong) NSData *data;         /**< 文件二进制数据 */
@property (nonatomic, strong) NSString *mimetype;   /**< 文件类型,如:image/jpg */


/**
 快速创建上传类
 
 @param name 文件名
 @param filename 文件放入文件夹后名字
 @param data 文件二进制数据(UIImage转NSData: UIImageJPEGRepresentation函数 )
 @param type 文件类型,如:image/jpg
 @return 对象
 */
+ (instancetype)createObject:(NSString*)name filename:(NSString*)filename data:(NSData*)data mimetype:(NSString*)type;

- (BOOL)isValid;
@end
