//
//  SSKWebserviceRequestURLStringContext.m
//  seqb
//
//  Created by sunshinek31 on 2017/8/7.
//  Copyright © 2017年 sunshinek31. All rights reserved.
//

#import "SSKWebserviceRequestURLStringContext.h"

@implementation SSKWebserviceRequestURLStringContext

+ (instancetype)createWithURLString:(NSString *)urlString
{
    SSKWebserviceRequestURLStringContext *context = [SSKWebserviceRequestURLStringContext new];
    context.URLString = [SSKWebserviceRequestURLString stringWithString:urlString];
    
    return context;
}

@end
