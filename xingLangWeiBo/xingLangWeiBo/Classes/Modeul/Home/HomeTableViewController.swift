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

    override func viewDidLoad() {
        super.viewDidLoad()
       vistorLoginView?.setUIInfo(nil, title: "关注一些人,回这里看看有什么惊喜关注一些人,回这里看看有什么惊喜")
//网络请求
        //unacceptable content-type: text/html}
        let AFN = AFHTTPSessionManager()
//        AFN.responseSerializer = AFHTTPResponseSerializer()
        AFN.responseSerializer.acceptableContentTypes?.insert("text/html")
        SVProgressHUD.show()
        AFN.GET("http://www.weather.com.cn/data/sk/101010100.html", parameters: nil, progress: nil, success: { (task, result) -> Void in
            print("请求成功")
            SVProgressHUD.dismiss()
            print(result)
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
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }



}
