//
//  Oauth2ViewController.swift
//  xingLangWeiBo
//
//  Created by Apple on 16/10/9.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//
//App Key：3221697989
//         123050457758183  
//           3221697989
//App Secret：9f1bc9a0cec3b770c18f061399177583
//https://api.weibo.com/oauth2/authorize
import UIKit

class Oauth2ViewController: UIViewController {
    //
    let client_id = "3221697989"
    let redirect_uri = "https://www.baidu.com/"
    var webView = UIWebView()
    override func loadView() {
        view=webView

        print(view)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadOauthPage()
        
    }
    private func setupUI(){
    self.navigationItem.leftBarButtonItem=UIBarButtonItem(title: "关闭", style: .Plain, target: self, action: "close")
    }
    private func loadOauthPage(){
      let urlString="https://api.weibo.com/oauth2/authorize?"+"client_id="+client_id+"&redirect_uri="+redirect_uri
       let url = NSURL(string: urlString)
        print(url)
        let request=NSURLRequest(URL: url!)
        webView.loadRequest(request)
        
    
    
    }
    @objc private func close(){
    dismissViewControllerAnimated(true) { () -> Void in
        print("登录页面返回")
        }
    
    
    
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
