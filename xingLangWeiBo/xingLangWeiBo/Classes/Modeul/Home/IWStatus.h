//
//  IWStatus.h
//  传智微博
//
//  Created by 李南江 on 14-7-8.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IWUser.h"

@interface IWStatus : NSObject
// 注意: MJExtension这个框架在转换的时候, 模型中的属性必须和字典中得key一致
// 如果不一致需要实现某些告诉系统, 字典中得哪个key对应模型中的哪个字典
/**
 *  1.用户头像1
 2.用户名字   1
 3.用户发送时间 1
 4.微博来自什么设备 1
 5.微博文字 1
 6.图片 1
 7.转发微博 1
 8.转发数 1
 9.评论数 1
 10.赞数 1 
 */
/** 字符串型的微博ID */
@property (nonatomic, copy) NSString *idstr;
/** 微博信息内容 */
@property (nonatomic, copy) NSString *text;
/** 微博创建时间 */
@property (nonatomic, copy) NSString *created_at;
/** 微博来源 */
@property (nonatomic, copy) NSString *source;

/** 转发数 */
@property (nonatomic, assign) int reposts_count;
/** 评论数 */
@property (nonatomic, assign) int comments_count;
/** 表态数(赞) */
@property (nonatomic, assign) int attitudes_count;

/** 微博作者的用户信息字段 */
@property (nonatomic, strong) IWUser *user;

/** 被转发的原微博信息字段，当该微博为转发微博时返回 */
@property (nonatomic, strong) IWStatus *retweeted_status;

/** 微博配图地址。多图时返回多图链接。无配图返回“[]” */
@property (nonatomic, strong) NSArray *pic_urls;

@end
