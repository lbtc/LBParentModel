# LBParentModel
一句代码实现字典转模型,  归档和解档案不用再写encodeWithCoder和initWithCoder

可实现NSNumber自动转NSString，  

自动屏蔽字典中与模型不匹配的属性，  

字典中的空类型自动转成空字符串  

支持归档，不用自己重写Coder方法  

使用说明：
在模型中继承 LBParentModel 即可
        #import <Foundation/Foundation.h>
        #import "LBParentModel.h"
        //只需要继承为父类就可以使用了
        @interface LBUserModel : LBParentModel
        


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
            
转换后的结果：  

![image](https://github.com/lbtc/LBParentModel/blob/master/img1.png)


            //归档
            NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingString:@"user.data"];
            [NSKeyedArchiver archiveRootObject:userModel toFile:filePath];
            
            //解档
            LBUserModel *user = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
            NSLog(@"%@",user);  
            
解档后的结果：  

![image](https://github.com/lbtc/LBParentModel/blob/master/img2.png)
