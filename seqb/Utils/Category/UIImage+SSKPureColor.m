//
//  UIImage+SSKPureColor.m
//  GiantSpider
//
//  Created by sunshinek31 on 2017/4/7.
//  Copyright © 2017年 sunshinek31. All rights reserved.
//

#import "UIImage+SSKPureColor.h"

@implementation UIImage (SSKPureColor)

+ (instancetype)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
