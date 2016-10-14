//
//  NavViewController.swift
//  xingLangWeiBo
//
//  Created by Apple on 16/10/14.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

import UIKit

class NavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //initialize
    override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
        super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
        let appearance = UIBarButtonItem.appearance()
        //设置默认状态文字颜色
//        var md :[String:AnyObject]?
        let md = NSMutableDictionary()
        md[NSForegroundColorAttributeName] = UIColor.orangeColor()
        appearance.setTitleTextAttributes(md[NSForegroundColorAttributeName] as! [String:AnyObject]? , forState: .Normal)
        //设置高亮状态
        let hightmd = NSMutableDictionary()
        hightmd[NSForegroundColorAttributeName] = UIColor.greenColor()
        appearance.setTitleTextAttributes(hightmd[NSForegroundColorAttributeName] as! [String:AnyObject]? , forState: .Highlighted)
        //设置不可用状态
        let dismd = NSMutableDictionary()
        dismd[NSForegroundColorAttributeName] = UIColor.greenColor()
        appearance.setTitleTextAttributes(dismd[NSForegroundColorAttributeName] as! [String:AnyObject]? , forState: .Disabled)
        
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
