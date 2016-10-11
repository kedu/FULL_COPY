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
//
//https://api.weibo.com/oauth2/access_token
//client_id
//client_secret
//
/**
*  post
必选	类型及范围	说明
client_id	true	string	申请应用时分配的AppKey。
client_secret	true	string	申请应用时分配的AppSecret。
grant_type	true	string	请求的类型，填写authorization_code

grant_type为authorization_code时
必选	类型及范围	说明
code	true	string	调用authorize获得的code值。
redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。
*/
import UIKit
import SVProgressHUD
import AFNetworking
class Oauth2ViewController: UIViewController {
    //

    
    var webView = UIWebView()
    override func loadView() {
        view=webView
        webView.delegate=self

        print(view)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadOauthPage()
        
    }
    private func setupUI(){
    self.navigationItem.leftBarButtonItem=UIBarButtonItem(title: "关闭", style: .Plain, target: self, action: "close")
        self.navigationItem.rightBarButtonItem=UIBarButtonItem(title: "自动填充", style: .Plain, target: self, action: "fullAccount")
    }
    private func loadOauthPage(){
      let urlString="https://api.weibo.com/oauth2/authorize?"+"client_id="+client_id+"&redirect_uri="+redirect_uri
       let url = NSURL(string: urlString)
//        print(url)
        let request=NSURLRequest(URL: url!)
        webView.loadRequest(request)
        
    
    
    }
    @objc private func fullAccount(){
    
    let jsString="document.getElementById('userId').value='1218773641@qq.com',document.getElementById('passwd').value='6586721b';"
        webView.stringByEvaluatingJavaScriptFromString(jsString)
    
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
/*
Optional(https://api.weibo.com/oauth2/authorize?client_id=3221697989&redirect_uri=https://www.baidu.com/#)
Optional(https://api.weibo.com/oauth2/authorize)
Optional(https://www.baidu.com/?code=e9a762ee222601bfc1dba55f6488db66)


*/
//专门处理webView所有的协议方法
extension Oauth2ViewController:UIWebViewDelegate{
    //将要开始加载
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
//        print(request.URL)
        guard let  urlString=request.URL?.absoluteString else{
        return false
        }
        if urlString.hasPrefix("https://api.weibo.com"){
        return true}

        if !urlString.hasPrefix(redirect_uri){
        return false
        }
        //程序走到这里,一定包含url
        guard let query = request.URL?.query else {
        
        return false
        }
        let codeStr = "code="
        let code = query.substringFromIndex(codeStr.endIndex)
        print(code)
//      loadAccessToken(code)
        userAccountViewModel().loadAccessToken(code) { (error) -> () in
            print("come here")
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }
        
        return false
    }

//    加载失败
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        
    }
    //已经开始加载
    func webViewDidStartLoad(webView: UIWebView) {
        SVProgressHUD.show()
        
    }
    //已经完成加载
    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
        
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        SVProgressHUD.dismiss()
    }
 
    
    
    
    
    
    
}
