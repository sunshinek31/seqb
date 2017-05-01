//
//  SSKDateFormatManager.m
//  seqb
//
//  Created by sunshinek31 on 2017/5/1.
//  Copyright © 2017年 sunshinek31. All rights reserved.
//

#import "SSKDateFormatManager.h"

@interface SSKDateFormatManager ()
@property (nonatomic, strong) NSMutableDictionary *cachedDateFormatDict;
@end

@implementation SSKDateFormatManager

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    static SSKDateFormatManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [[SSKDateFormatManager alloc]init];
   
        // dateFormatter在iOS7之前, 属于非线程安全
#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_8_0
        
        manager.cachedDateFormatDict = [[NSThread currentThread] threadDictionary];
        
#endif
        
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
        
        manager.cachedDateFormatDict = [NSMutableDictionary dictionary];
#endif
        
    });
    return manager;
}

- (NSDateFormatter *)dateFormatterWithTemplate:(NSString *)aTemplate
{
    NSDateFormatter *dateFormatter = [self.cachedDateFormatDict objectForKey:aTemplate];
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setLocale:[NSLocale currentLocale]];
        [dateFormatter setDateFormat: aTemplate];
        [self.cachedDateFormatDict setObject:dateFormatter forKey:aTemplate];
    }
    return dateFormatter;
}

@end
