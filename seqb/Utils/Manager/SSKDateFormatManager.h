//
//  SSKDateFormatManager.h
//  seqb
//
//  Created by sunshinek31 on 2017/5/1.
//  Copyright © 2017年 sunshinek31. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 日期时间解析格式模块管理器
 
 由于dateFormat性能消耗原因, 故不适合频繁创建;
 可以通过该类, 管理所有的日期模块, 缓存至内存
 */
@interface SSKDateFormatManager : NSObject

+ (instancetype)shareInstance;

/**
 根据日期文字模块获取dateFormatter对象

 @param aTemplate 日期模板,如'yyyy-MM-dd HH:mm:ss'
 @return NSDateFormatter对象
 */
- (NSDateFormatter *)dateFormatterWithTemplate:(NSString *)aTemplate;

@end
