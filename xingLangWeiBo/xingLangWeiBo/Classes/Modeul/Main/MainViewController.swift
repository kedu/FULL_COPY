//
//  MainViewController.swift
//  xingLangWeiBo
//
//  Created by Apple on 16/10/8.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    //点击加号做的事情
    @objc private func composeDidClick(){
    print(__FUNCTION__)
//        let composeVC = composeViewController()
        let sb = UIStoryboard(name: "Compose", bundle: nil)
        let composeVC = sb.instantiateInitialViewController()
        let nav = NavViewController(rootViewController: composeVC!)
        
        presentViewController(nav, animated: true) { () -> Void in
            print("composeVC被模态出来了")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      let mainTabBar=MainTabBar()
        setValue(mainTabBar, forKey: "tabBar")
        //添加子视图控制器
        addChildviewcontrollers()
        //
//        print(tabBar.classForCoder)
        //
        mainTabBar.composeBtn.addTarget(self, action:"composeDidClick", forControlEvents: .TouchUpInside)
        
    }
    private  func  addChildviewcontrollers() {
            addChildViewController(HomeTableViewController(), title: "首页", imageName: "tabbar_home")
           addChildViewController(MessageTableViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(DiscoverTableViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(ProfileTableViewController(), title: "我", imageName: "tabbar_profile")
        //重载
    }
    private func addChildViewController(vc:UIViewController ,title:String, imageName:String ) {
//        let home=HomeTableViewController()
        //实例化导航控制器
        let nav=UINavigationController(rootViewController: vc)
        vc.title=title;
        self.tabBar.tintColor=UIColor.orangeColor()
 
        vc.tabBarItem.selectedImage=UIImage(named: imageName+"_highlighted")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        vc.tabBarItem.image=UIImage(named: imageName)
//        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.orangeColor()], forState: UIControlState.Normal )
        addChildViewController(nav)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
