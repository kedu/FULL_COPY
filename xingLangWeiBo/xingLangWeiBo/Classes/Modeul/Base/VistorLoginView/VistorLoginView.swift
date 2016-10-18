//
//  VistorLoginView.swift
//  xingLangWeiBo
//
//  Created by Apple on 16/10/8.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

import UIKit
//代理
protocol VistorLoginViewDelegate :NSObjectProtocol {
  //协议方法
    //登录
    func vistorWillLogin()
    //注册
    func visitorWillRegister()
}


class VistorLoginView: UIView {
    //声明属性
    weak var visitorDelegate:VistorLoginViewDelegate?
    @objc func loginDidClick(){
    visitorDelegate?.vistorWillLogin()
    }
    @objc func registerDidClick(){
        visitorDelegate?.visitorWillRegister()
    }
    //设置页面信息
    func setUIInfo( imageName : String?, title : String  ){
       iconView.hidden=false
        let v: String! = imageName
        if v != nil
        {
            self.circleView.image=UIImage(named: imageName!)
            iconView.hidden=true
        }else{
        
        setAni()
        }
        
    tipLabel.text=title
    
    }
    private func setAni(){
    
      let anim = CABasicAnimation(keyPath: "transform.rotation")
      anim.repeatCount=MAXFLOAT
        anim.toValue=2*M_PI
        anim.duration=10
        //视图不活跃时不会移除图层
        anim.removedOnCompletion=false
        circleView.layer.addAnimation(anim, forKey: nil)
        
    
    
    }
    //重写构造方法
    init(){
        super.init(frame:CGRectZero)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //设置访客视图
    private func setupUI(){
    
        addSubview(circleView)
         addSubview(backView)
        addSubview(iconView)
        addSubview(tipLabel)
        addSubview(loginBtn)
        addSubview(registerBtn)
        
        
        for v  in subviews {
        
         v.translatesAutoresizingMaskIntoConstraints = false
        
        }
        addConstraint(NSLayoutConstraint(item: circleView, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: 0))
        addConstraint( NSLayoutConstraint(item: circleView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .CenterX, relatedBy: .Equal, toItem: circleView, attribute: .CenterX, multiplier: 1.0, constant: 0))
        
        addConstraint( NSLayoutConstraint(item: iconView, attribute: .CenterY, relatedBy: .Equal, toItem: circleView, attribute: .CenterY, multiplier: 1.0, constant: 0))
        
//    
        addConstraint(NSLayoutConstraint(item: tipLabel, attribute: .CenterX, relatedBy: .Equal, toItem: circleView, attribute: .CenterX, multiplier: 1.0, constant: 0))
        addConstraint( NSLayoutConstraint(item: tipLabel, attribute: .Top, relatedBy: .Equal, toItem: circleView, attribute: .Bottom, multiplier: 1.0, constant: 40))
        
        //设置宽度
        addConstraint(NSLayoutConstraint(item: tipLabel, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 224))
        

      addConstraint(NSLayoutConstraint(item: tipLabel, attribute: .Height, relatedBy: .Equal, toItem: nil , attribute: .NotAnAttribute, multiplier: 1.0, constant: 50))
        
        //设置登录约束
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .Left, relatedBy: .Equal, toItem: tipLabel, attribute: .Left, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .Top, relatedBy: .Equal, toItem: tipLabel, attribute: .Bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100))
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 35))
        //设置注册约束
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: .Right, relatedBy: .Equal, toItem: tipLabel, attribute: .Right, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: .Top, relatedBy: .Equal, toItem: tipLabel, attribute: .Bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100))
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 35))
        //backView约束
//        addConstraint(NSLayoutConstraint(item: backView, attribute: .CenterX, relatedBy: .Equal, toItem: circleView, attribute: .CenterX, multiplier: 1.0, constant: 0))
        
//        addConstraint( NSLayoutConstraint(item: backView, attribute: .CenterY, relatedBy: .Equal, toItem: circleView, attribute: .CenterY, multiplier: 1.0, constant: 0))

        addConstraints( NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[backView]-0-|", options: [], metrics: nil, views:["backView":backView]))
        addConstraints( NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[backView]-(-45)-[registerBtn]", options: [], metrics: nil, views:["backView":backView,"registerBtn":registerBtn]))
      self.backgroundColor=UIColor(white: 0.93, alpha: 1)
 /// 添加点击事件
        loginBtn.addTarget(self, action: "loginDidClick", forControlEvents: .TouchUpInside)
        registerBtn.addTarget(self, action: "registerDidClick", forControlEvents: .TouchUpInside)
        
    
    }
  
    
    private lazy var iconView : UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    
      private lazy var circleView : UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    
    private lazy var backView : UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    //提交文案
    private lazy var tipLabel : UILabel = {
       let l=UILabel()
          l.text="关注一些人,回这里看看有什么惊喜关注一些人,回这里看看有什么惊喜"

         l.textAlignment = NSTextAlignment.Center
        l.font = UIFont.systemFontOfSize(14)
        l.textColor = UIColor.lightGrayColor()
        l.numberOfLines = 0
        l.sizeToFit()
        
        
        
        return l
    }()
    
    private lazy var loginBtn : UIButton = {
    
    let btn = UIButton()
    
        btn .setTitle("登录", forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState:.Normal)
        btn.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        return btn
    
    
    }()
    private lazy var registerBtn : UIButton = {
        
        let btn = UIButton()
        btn .setTitle("注册", forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState:.Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        return btn
        
        
    }()
    
 

}

