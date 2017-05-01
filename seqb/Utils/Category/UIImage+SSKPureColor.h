//
//  UIImage+SSKPureColor.h
//  GiantSpider
//
//  Created by sunshinek31 on 2017/4/7.
//  Copyright © 2017年 sunshinek31. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 通过色值构造纯色uiimage对象
 */
@interface UIImage (SSKPureColor)

+ (instancetype)imageWithColor:(UIColor *)color;

@end
