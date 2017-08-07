//
//  SSKUploadFileObject.m
//  seqb
//
//  Created by sunshinek31 on 2017/5/1.
//  Copyright © 2017年 sunshinek31. All rights reserved.
//

#import "SSKUploadFileObject.h"

@implementation SSKUploadFileObject
+ (instancetype)createObject:(NSString*)name filename:(NSString*)filename data:(NSData*)data mimetype:(NSString*) type
{
    SSKUploadFileObject *obj = [[SSKUploadFileObject alloc] init];
    obj.name = name;
    obj.filename = filename;
    obj.data = data;
    obj.mimetype = type;
    return obj;
}

- (BOOL)isValid
{
    BOOL ret = NO;
    if (self.data.length > 0) {
        ret = YES;
    }
    return ret;
}
@end
