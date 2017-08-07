//
//  SSKWebserviceRequestURLStringContext.h
//  seqb
//
//  Created by sunshinek31 on 2017/8/7.
//  Copyright © 2017年 sunshinek31. All rights reserved.
//

#define kCreateURLString(str) [SSKWebserviceRequestURLStringContext createWithURLString:str]

#import <Foundation/Foundation.h>
#import "SSKWebserviceRequestURLString.h"

@interface SSKWebserviceRequestURLStringContext : NSObject
@property (nonatomic, copy) SSKWebserviceRequestURLString *URLString;

+ (instancetype)createWithURLString:(NSString *)urlString;
@end
