

#import <Foundation/Foundation.h>


/**
 对象解析拓展类别
 */
@interface NSDictionary (Obj2Dict)


/**
 将NSObject对象之间解析成一个字典对象

 @param obj NSObject对象
 @param replaceAttr 替换字段(一般用户替换关键字, 如属性为uid需要解析替换为id的时候;可nil)
 @return 字典对象
 */
+ (instancetype)parseObject:(id)obj replaceAttr:(NSDictionary *)replaceAttr;

@end
