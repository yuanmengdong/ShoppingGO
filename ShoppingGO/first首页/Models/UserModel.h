//
//  UserModel.h
//  首页测试1
//
//  Created by rimi on 16/3/21.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

//用户名
@property (nonatomic,copy) NSString *username;
//介绍
@property (nonatomic,copy) NSString *introduction;
//头像图片路径
@property (nonatomic,copy) NSString *imagePath;

@property (nonatomic,copy) NSString *imageHeadPath;

@end
