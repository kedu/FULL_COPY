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
//            print(result)
            /**
            *    // 1.存储获取到得微博数据
            // 获取字典数组
            NSArray *newStatus = responseObject[@"statuses"];
            // 将字典数组转换为模型数据
            NSArray *models = [IWStatus objectArrayWithKeyValuesArray:newStatus];
            NSRange range = NSMakeRange(0, models.count);
            NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
            [self.statuses insertObjects:models atIndexes:indexSet];
           
            */
            let statuses = result!["statuses"] as! NSArray
            for  dict  in statuses {
                let dict_tmp = dict as! NSDictionary
              let homeModel = HomeModel()
                homeModel.source = dict_tmp["source"] as! String//来源
                
                print(homeModel.source!)
              
            //添加模型
                self.data?.addObject(homeModel)
            }

            
            
            

            }) { (_, error) -> Void in
                print("请求失败")
                SVProgressHUD.showErrorWithStatus("网络请求失败")
                print(error)
        }
        
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
        return 1
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        //创建cell
        if let cell = tableView.dequeueReusableCellWithIdentifier("HOmeTableViewCell") {
        return cell
        }
        let cell = HOmeTableViewCell(style: .Default, reuseIdentifier: "HOmeTableViewCell")
       
        return cell
    
    
    
    
    }




}
