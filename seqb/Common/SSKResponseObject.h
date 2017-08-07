//
//  SSKResponseObject.h
//  seqb
//
//  Created by sunshinek31 on 2017/5/1.
//  Copyright © 2017年 sunshinek31. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 响应数据对象(可根据实际情况变更属性)
 */
@interface SSKResponseObject : NSObject

@property (nonatomic, copy) NSString *respMsg; /**< 接口回调信息说明 */
@property (nonatomic, strong) id respData;      /**< 接口回调数据代号 */
@property (nonatomic, copy) NSString *respCode; /**< 接口回调数据代号 */

@end
