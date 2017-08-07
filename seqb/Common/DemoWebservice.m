//
//  DemoWebservice.m
//  seqb
//
//  Created by sunshinek31 on 2017/8/7.
//  Copyright © 2017年 sunshinek31. All rights reserved.
//

#import "DemoWebservice.h"

@implementation DemoWebservice

- (void)requestData:(void (^)(NSError *))c
{
    [self sendPost:kTestURL params:nil success:^(SSKResponseObject *responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

@end
