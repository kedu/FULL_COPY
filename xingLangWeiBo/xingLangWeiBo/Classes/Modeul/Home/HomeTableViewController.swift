//
//  HomeTableViewController.swift
//  xingLangWeiBo
//
//  Created by Apple on 16/10/8.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//


import UIKit
import AFNetworking
import SVProgressHUD

class HomeTableViewController: BaseTableViewController {
    var data : NSMutableArray?
     var status : IWStatus?
    override func viewDidLoad() {
        super.viewDidLoad()
       vistorLoginView?.setUIInfo(nil, title: "关注一些人,回这里看看有什么惊喜关注一些人,回这里看看有什么惊喜")
        //数据有了,转模型
        data = NSMutableArray()
         let access_token = userAccountViewModel().token
        if access_token == nil {
            return
            }
        getUseWeiBo()
    }
    //获取当前登录用户及其所关注（授权）用户的最新微博
    func getUseWeiBo(){
        //网络请求
        let AFN = AFHTTPSessionManager()
        AFN.responseSerializer.acceptableContentTypes?.insert("gzip")
        SVProgressHUD.show()
        //获取access_token
        let access_token = userAccountViewModel().token
//        App Key：3221697989
        let App_Key = 3221697989
        let urlString = "https://api.weibo.com/2/statuses/home_timeline.json?access_token=" + access_token!
        print(urlString)
        AFN.GET(urlString, parameters: nil, progress: nil, success: { (task, result) -> Void in
            print("请求成功")
            SVProgressHUD.dismiss()

            let statuses = result!["statuses"] as! NSArray
            for  dict  in statuses {
                let dict_tmp = dict as! NSDictionary
              let homeModel = HomeModel()
     
                homeModel.source = dict_tmp["source"] as! String//来源
                 homeModel.created_at = dict_tmp["created_at"] as! String
                 homeModel.text = dict_tmp["text"] as! String
                 homeModel.idstr = dict_tmp["idstr"] as! String
                 homeModel.reposts_count = dict_tmp["reposts_count"] as! Int
                 homeModel.comments_count = dict_tmp["comments_count"] as! Int
                 homeModel.attitudes_count = dict_tmp["attitudes_count"] as! Int
                 homeModel.profile_image_url = dict_tmp["user"]!["profile_image_url"] as! String
                homeModel.name = dict_tmp["user"]!["name"] as! String
                homeModel.mbrank = dict_tmp["user"]!["mbrank"] as! Int
                 homeModel.mbtype = dict_tmp["user"]!["mbtype"] as! Int
                if ((dict_tmp["user"]! as! NSDictionary).objectForKey("verified_level") != nil){
                    homeModel.verified_level = dict_tmp["user"]!["verified_level"] as! Int}else{
                homeModel.verified_level = 100
                
                }
                //thumbnail_pic
                let obj = (dict_tmp as! NSDictionary).objectForKey("pic_urls") as! NSObject
                if (obj.isKindOfClass(NSNull) ){
                print("我为空l")
                
                }
                else
                {
                    homeModel.pic_urls = dict_tmp["pic_urls"] as? NSArray }

                
            //添加模型
                self.data?.addObject(homeModel)
            }
            self.tableView.reloadData()

            
            
            

            }) { (_, error) -> Void in
                print("请求失败")
                SVProgressHUD.showErrorWithStatus("网络请求失败")
                print(error)
        }
        
    }
    //返回cell的高度
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    let cell = tableView.dequeueReusableCellWithIdentifier("HOmeTableViewCell") as! HOmeTableViewCell
        
        
        return cell.cellHeightWithHomeModel(data![indexPath.row] as! HomeModel)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (data?.count)!
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        //创建cell
        let cell = tableView.dequeueReusableCellWithIdentifier("HOmeTableViewCell") as? HOmeTableViewCell
        if data?.count > 0 {
            cell?.homeModel = data![indexPath.row] as? HomeModel
        }
        return cell!
    
    
    
    
    }
    




}
