//
//  composeViewController.swift
//  xingLangWeiBo
//
//  Created by Apple on 16/10/14.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

import UIKit
import SVProgressHUD
import AFNetworking
class composeViewController: UIViewController,UITextViewDelegate{
    
    //文本view
    @IBOutlet weak var textView: UIView!
    //图片view
    @IBOutlet weak var picView: UICollectionView!
    var input : InputView?
    var toolbar : toolbarView?
//    var keyboard : uik
    override func viewDidLoad() {
        super.viewDidLoad()
        //1.设置导航条
        title="发送微博"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: .Plain, target: self, action:"close")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "发送", style: .Plain, target: self, action: "compose")

        let input = InputView()
        self.input = input
        self.textView.frame = input.frame
        input.translatesAutoresizingMaskIntoConstraints=false
        input.backgroundColor = UIColor.orangeColor()
        input.alwaysBounceVertical=true
        input.delegate=self
//        view.addSubview(input)
         textView.addSubview(input)
        view.addSubview(textView)
        
//        view.addConstraint(NSLayoutConstraint(item: input, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1, constant: 0))
//        view.addConstraint(NSLayoutConstraint(item: input, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 1, constant: 0))
//        */没有内容发送不可用
        navigationItem.rightBarButtonItem?.enabled = false
        //创建自定义工具条
        let toolbar = toolbarView()
         toolbar.frame =  CGRectMake(0, view.frame.height-44, view.frame.width, 44)
        view.addSubview(toolbar)
        self.toolbar = toolbar
        //监听
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didShow:", name: UIKeyboardWillShowNotification, object: nil)
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "didHide:", name: UIKeyboardDidHideNotification, object: nil)
        
    }
    func didShow(note:NSNotification){
      print(note)
        //取出键盘的frame
        let temp = note.userInfo![UIKeyboardFrameEndUserInfoKey]

        let keyboardframe_temp = temp! as? NSValue
       let keyboardframe = keyboardframe_temp!.CGRectValue()
        let keyHight = keyboardframe.size.height
        //
//        NSRectToCGRect()
        let aniations = (note.userInfo![UIKeyboardAnimationCurveUserInfoKey] as? Int)! << 16
//        let aniationsOptions = aniations as?  UIViewAnimationOptions
  let time = NSTimeInterval(note.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Float)
        //UIViewAnimationOptions  //7<<16键盘的动画节奏
        UIView.animateWithDuration(time, delay: 0, options: .CurveLinear ,animations: { () -> Void in
        self.toolbar?.transform = CGAffineTransformMakeTranslation(0, -keyHight)
        }, completion: nil)
       
    
    
    
    }
    func didHide(note:NSNotification){
       print(note)
        let temp = note.userInfo![UIKeyboardFrameEndUserInfoKey]
        
        let keyboardframe_temp = temp! as? NSValue
        let keyboardframe = keyboardframe_temp!.CGRectValue()
        let keyHight = keyboardframe.size.height
        let time = NSTimeInterval(note.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Float)
        //UIViewAnimationOptions  //7<<16键盘的动画节奏

        UIView.animateWithDuration(time, delay: 0, options: .CurveLinear ,animations: { () -> Void in
            self.toolbar?.transform = CGAffineTransformIdentity
            }, completion: nil)
    
    
    }
    func textViewDidChange(textView: UITextView) {
        //设置按钮状态
        navigationItem.rightBarButtonItem?.enabled=(textView.text.characters.count>0)
        
    }
   
    func close (){
    print("取消")
        input?.resignFirstResponder()
        dismissViewControllerAnimated(true, completion: nil)
    }
    func compose (){
        //发送请求
        let AFN = AFHTTPSessionManager()
        let par = NSMutableDictionary()
        par["access_token"] = "2.00se1ysCnouBWDcb50c48d2cHieWbE"
        par["status"] = input?.text
        let urlstring = "https://api.weibo.com/2/statuses/update.json"
        AFN.POST(urlstring, parameters: par, success: { (dataTask, respond) -> Void in
            print(respond)
            SVProgressHUD.showSuccessWithStatus("成功")
            }) { (_, error) -> Void in
                print(error)
                SVProgressHUD.showSuccessWithStatus("失败")
        }
        input?.resignFirstResponder()
        dismissViewControllerAnimated(true, completion: nil)
        print("发送")
        
    }
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        view.endEditing(true)
    }
    deinit{
    
    NSNotificationCenter.defaultCenter().removeObserver(self)
    
    
    
    }


}
