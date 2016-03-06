//
//  LBUserModel.h
//  
//
//  Created by 李斌 on 15/6/16.
//
//

#import <Foundation/Foundation.h>

#import "LBParentModel.h"
//只需要继承为父类就可以使用了
@interface LBUserModel : LBParentModel
/**
 用户昵称
 */
@property (nonatomic, copy) NSString *userName;

/**
 用户id号
 */
@property (nonatomic, copy) NSString *usid;

/**
 用户头像的url
 */
@property (nonatomic, copy) NSString *iconURL;

/**
 用户授权后得到的accessToken
 */
@property (nonatomic, copy) NSString *accessToken;




@end
