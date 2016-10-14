//
//  composeViewController.swift
//  xingLangWeiBo
//
//  Created by Apple on 16/10/14.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

import UIKit

class composeViewController: UIViewController,UITextViewDelegate {
//    override func loadView() {
//   
//        
//   
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title="发送微博"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: .Plain, target: self, action:"close")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "发送", style: .Plain, target: self, action: "compose")

        let input = InputView()
        input.translatesAutoresizingMaskIntoConstraints=false
        input.backgroundColor = UIColor.orangeColor()
        input.alwaysBounceVertical=true
        input.delegate=self
        view.addSubview(input)//这个时候inputView为空
         view.addConstraint(NSLayoutConstraint(item: input, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: input, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 1, constant: 0))
//        */没有内容发送不可用
        navigationItem.rightBarButtonItem?.enabled = false
    }
    func textViewDidChange(textView: UITextView) {
        //设置按钮状态
        navigationItem.rightBarButtonItem?.enabled=(textView.text.characters.count>0)
    }
   
    func close (){
    print("取消")
    
    
    }
    func compose (){
        print("发送")
        
        
    }


}
