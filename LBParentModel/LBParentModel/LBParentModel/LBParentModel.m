//
//  LBParentModel.m

//
//  Created by 李斌 on 15/11/9.
//  Copyright © 2015年 Libin. All rights reserved.
//

#import "LBParentModel.h"

@interface LBParentModel ()<NSCoding>
@end
@implementation LBParentModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"%@类缺少%@字段",NSStringFromClass(self.class),key);
}

- (void)setValue:(id)value forKey:(NSString *)key{
    if([value isKindOfClass:[NSNumber class]]) {
         //NSNumber类型转成NSString
        NSNumberFormatter *format = [[NSNumberFormatter alloc] init];
        value = [format stringFromNumber:value];
    }else if([value isKindOfClass:[NSNull class]]){
        value = @"";
    }
     //经过上面的if判断转换后，value的值都被转成了NSString类型，再通过 [super setValue:value forKey:key]执行KVC赋值
    [super setValue:value forKey:key];
}


- (instancetype)initWithDict:(NSDictionary*)dictionary{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

+ (instancetype)modelWithDict:(NSDictionary *)dictionary{
    return [[self alloc] initWithDict:dictionary];
}


#pragma mark- 用于归档／解档
// 归档
- (void)encodeWithCoder:(NSCoder*)encoder
{
    unsigned int count;
    //count 放入此函数后会自动被赋值为类中属性的个数
    Ivar* ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        //取到属性名
        const char* name = ivar_getName(ivar);
        //将属性名转成字符串
        NSString* strName = [NSString stringWithUTF8String:name];
        //取出属性名对应的值
        id value = [self valueForKey:strName];
        //归档
        [encoder encodeObject:value forKey:strName];
    }
    //class_copyIvarList返回的ivar类实例需要释放
    free(ivars);
}

// 解档
- (instancetype)initWithCoder:(NSCoder*)decoder
{
    if (self = [super init]) {
        unsigned int count;
        Ivar* ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivars[i];
            const char* name = ivar_getName(ivar);
            NSString* strName = [NSString stringWithUTF8String:name];
            id value = [decoder decodeObjectForKey:strName];
            [self setValue:value forKey:strName];
        }
        //class_copyIvarList返回的ivar类实例需要释放
        free(ivars);
    }
    return self;
}


@end
