//
//  HomeModel.swift
//  xingLangWeiBo
//
//  Created by Apple on 16/10/18.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

import UIKit

class HomeModel: NSObject {
    /** 字符串型的微博ID */
    var idstr : String?
    /** 微博信息内容 */
    var text : String?
    /** 微博创建时间 */
    var created_at : String?
    /** 微博来源 */
    var source : String?
    /** 转发数 */
    var reposts_count : NSNumber?
    /** 评论数 */
     var comments_count : NSNumber?
    /** 表态数(赞) */
    var attitudes_count : NSNumber?
    /** 微博作者的用户信息字段 */
    var account : userAccountViewModel?
    /** 被转发的原微博信息字段，当该微博为转发微博时返回 */
    var retweeted_status : NSDictionary?
    /** 微博配图地址。多图时返回多图链接。无配图返回“[]” */
    var pic_urls : NSArray?
    //用户头像
    var profile_image_url : String?
    //昵称
    var name : String?
    //用户type
    var mbtype : Int?
    //用户会员等级
    var mbrank : Int?
    //认证等级
    var verified_level : Int?
    func isVip() -> Bool{
        if mbtype > 2 {
        
        
        return true
        }
        return false
    }

    

    

}
