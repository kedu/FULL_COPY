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
    var reposts_count : Int?
    /** 评论数 */
     var comments_count : Int?
    /** 表态数(赞) */
    var attitudes_count : Int?
    /** 微博作者的用户信息字段 */
    var account : userAccountViewModel?
    /** 被转发的原微博信息字段，当该微博为转发微博时返回 */
    var retweeted_status : String?
    /** 微博配图地址。多图时返回多图链接。无配图返回“[]” */
    var pic_urls : NSArray?
    //字典转模型
//    init(dict:[String : AnyObject]) {
//        super.init()
////        super.init()
//        setValuesForKeysWithDictionary(dict)
//        
//    }
}
