

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (instancetype)colorWithHexString:(NSString *)color;

+ (instancetype)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
