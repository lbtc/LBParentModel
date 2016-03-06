//
//  ViewController.m
//  LBParentModel
//
//  Created by 李斌 on 16/3/6.
//  Copyright © 2016年 xiaoyungo. All rights reserved.
//

#import "ViewController.h"
#import "LBUserModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dict = @{
                           @"userName" : @"xiaoming",
                               @"usid" : @100001,
                               @"iconURL" : @"www.baidu.com",
                               @"accessToken" : [NSNull null],
                            @"unknow" : @10
                           };
    //一句代码实现，字典转模型.
    /*
     可实现NSNumber自动转NSString，
     自动屏蔽字典中与模型不匹配的属性，
     字典中的空类型自动转成空字符串
     支持归档，不用自己重写Coder方法
     */
    LBUserModel *userModel = [LBUserModel modelWithDict:dict];
    NSLog(@"%@",userModel);
    
    //归档
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingString:@"user.data"];
    [NSKeyedArchiver archiveRootObject:userModel toFile:filePath];
    
    //解档
    LBUserModel *user = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@",user);
    
    
    
}

@end
