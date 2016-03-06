//
//  LBParentModel.h
//
//  Created by 李斌 on 15/11/9.
//  Copyright © 2015年 Libin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface LBParentModel : NSObject

+ (instancetype)modelWithDict:(NSDictionary *)dictionary;
@end
