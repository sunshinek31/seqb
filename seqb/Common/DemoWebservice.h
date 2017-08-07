//
//  DemoWebservice.h
//  seqb
//
//  Created by sunshinek31 on 2017/8/7.
//  Copyright © 2017年 sunshinek31. All rights reserved.
//

#import "SSKBaseWebservice.h"

@interface DemoWebservice : SSKBaseWebservice

- (void)requestData:(void(^)(NSError *error))completion;

@end
