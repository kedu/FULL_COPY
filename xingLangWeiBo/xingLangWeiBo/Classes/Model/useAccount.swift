//
//  useAccount.swift
//  xingLangWeiBo
//
//  Created by Apple on 16/10/10.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

import UIKit
//保存用户信息
class useAccount: NSObject,NSCoding {
    var  access_token :String?
    var  expires_in:NSTimeInterval=0
    var  uid:String?
    var  avatar_large:String?
    var  name:String?
    init(dict:[String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
        
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    override var description : String {
        let keys = ["access_token","expires_in","uid","avatar_large","name"]
    return dictionaryWithValuesForKeys(keys).description
    }
    //归档
    func saveAccount(){
        
    let path = (NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last! as NSString).stringByAppendingPathComponent("account.plist")
        
       NSKeyedArchiver.archiveRootObject(self, toFile: path)
        print(path)
    
    }
    //解归档
    class func loadAccount() ->useAccount?{
        let path = (NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last! as NSString).stringByAppendingPathComponent("account.plist")
        if let account = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? useAccount {
        return account
        }
        return nil
    }
    
    //解归档
    required init?(coder aDecoder: NSCoder) {
        access_token = aDecoder.decodeObjectForKey("access_token") as? String
        expires_in = aDecoder.decodeDoubleForKey("expires_in")
        uid = aDecoder.decodeObjectForKey("uid") as? String
        avatar_large = aDecoder.decodeObjectForKey("avatar_large") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        
    }
    //归档
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(access_token, forKey: "access_token")
        aCoder.encodeDouble(expires_in, forKey: "expires_in")
         aCoder.encodeObject(uid, forKey: "uid")
         aCoder.encodeObject(avatar_large, forKey: "avatar_large")
         aCoder.encodeObject(name, forKey: "name")
        
        
        
        
    }
}
