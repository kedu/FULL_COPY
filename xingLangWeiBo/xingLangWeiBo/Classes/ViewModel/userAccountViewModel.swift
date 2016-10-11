//
//  userAccountViewModel.swift
//  xingLangWeiBo
//
//  Created by Apple on 16/10/11.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

import UIKit
import SVProgressHUD
import AFNetworking
//viewModel将一些业务逻辑封装到这个类里 让这个类隔离的更好
//网络方法
class userAccountViewModel: NSObject {
    //增加 account
    var account : useAccount?
    //用户是否登录
    var useLogin : Bool  {
        return account?.access_token != nil
    }
    var token : String? {
    
    return account?.access_token
    
    }
//    在init方法
    override init() {
        account = useAccount.loadAccount()
    }
    
    func loadAccessToken(code:String,finished: (error : NSError?) -> ()){
        let urlString = "https://api.weibo.com/oauth2/access_token"
        let parmeters = ["client_id":client_id,"client_secret":client_secret,"grant_type":"authorization_code","code":code,"redirect_uri":redirect_uri]
        let AFN=AFHTTPSessionManager()
        AFN.responseSerializer.acceptableContentTypes?.insert("text/plain")
        AFN.POST(urlString, parameters: parmeters, success: { (_, result) -> Void in
            print(result)
            
            if let dict = result as? [String:AnyObject] {
                
                let account = useAccount(dict: dict)
                print(account)
                self.loadUseInfo(account, finished: finished)
                //              let access_token = dict["access_token"] as? String
                //              let uid = dict["uid"] as? String
                //                self.loadUseInfo(account)
            }
            
            }) { (_, error) -> Void in
                print(error)
        }
        
    }
//加载用户信息
    private func loadUseInfo(account:useAccount,finished: (error : NSError?) -> ()){
        let urlString = "https://api.weibo.com/2/users/show.json"
        let pares = ["access_token":account.access_token!,"uid":account.uid!]
        let AFN = AFHTTPSessionManager()
        AFN.GET(urlString, parameters: pares, success: { (_, result) -> Void in
            print(result)
            if let dict = result as? [String:AnyObject] {
                
                account.avatar_large=dict["avatar_large"] as? String
                account.name=dict["name"] as? String
                account.saveAccount()
                print(account)
                finished(error: nil)
            }
            })
            { (_, error) -> Void in
                print(error)
                finished(error: error)
        }
        //保存用户数据
        
        
        
    }

}
