//
//  AppDelegate.swift
//  xingLangWeiBo
//
//  Created by Apple on 16/10/7.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

import UIKit
//import 
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
    var window: UIWindow?
    //开始测试
    //配置了ssh通道,测试一下
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let account = useAccount.loadAccount()
        print(account)
        // Override point for customization after application launch.
        window=UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor=UIColor.whiteColor()
        window?.makeKeyAndVisible()
        //设置主题色
        setThemeColor()
        //设置根控制器
        window?.rootViewController=MainViewController()
        return true
    }
    private func setThemeColor(){
     UINavigationBar.appearance().tintColor=themeColor
    UITabBar.appearance().tintColor=themeColor
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    //接受内存警告处理
    func applicationDidReceiveMemoryWarning(application: UIApplication) {
        //没用sdwebimage
        
    }


}

