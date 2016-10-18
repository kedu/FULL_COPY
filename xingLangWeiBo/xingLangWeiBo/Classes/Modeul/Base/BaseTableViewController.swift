//
//  BaseTableViewController.swift
//  xingLangWeiBo
//
//  Created by Apple on 16/10/8.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController,VistorLoginViewDelegate {
    //loadview专门为手写代码  等效于 sb 与 xib
    //一旦实现 xib和sb 自动失败
    //添加用户是否登录
    var userLogin =  userAccountViewModel().useLogin
    var vistorLoginView:VistorLoginView?
    func userLogin_kvo(){

    }
    override func loadView() {
        userLogin ? super.loadView() : loadVisterVier()
    }
    
    func vistorWillLogin() {
        print("登录")
        let Oauth2vc=Oauth2ViewController()
        let nav=UINavigationController(rootViewController: Oauth2vc)
        presentViewController(nav, animated: true) { () -> Void in
            print("进入登录页面")
        }
    }
    func visitorWillRegister() {
        print("注册")
    }
    private func loadVisterVier(){
        vistorLoginView = VistorLoginView()
       vistorLoginView?.visitorDelegate=self
        view = vistorLoginView
        
        self.navigationItem.rightBarButtonItem=UIBarButtonItem(title: "登录", style: .Plain, target: self, action: "vistorWillLogin")
        self.navigationItem.leftBarButtonItem=UIBarButtonItem(title: "注册", style: .Plain, target: self, action: "visitorWillRegister")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
