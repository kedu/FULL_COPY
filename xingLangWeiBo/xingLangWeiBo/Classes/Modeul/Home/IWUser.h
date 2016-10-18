//
//  IWUser.h
//  传智微博
//
//  Created by 李南江 on 14-7-8.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IWUser : NSObject

/** 字符串型的用户UID */
@property (nonatomic, copy) NSString *idstr;
/** 友好显示名称 */
@property (nonatomic, copy) NSString *name;
/** 用户头像地址（中图），50×50像素 */
@property (nonatomic, copy) NSString *profile_image_url;

@end
