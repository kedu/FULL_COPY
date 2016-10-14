//
//  UIButton+Extension.swift
//  SinaWeibo
//
//  Created by apple on 15/11/12.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit


//对UIButton 进行扩展
extension UIButton {
    
    //在分类中 需要使用便利的构造方法  有可能实例化一个空对象 
    //就是在指定的构造行数基础上  对其进行扩展
    //必须调用指定的构造函数  调用方式  self.
    //相对于 指定的构造方法
    //构造方法最大的一个特点 没有返回值
    
    //构造器 
    convenience init(title: String,backImage: String,color: UIColor?) {
        
        //调用构造方法 实例化
        self.init()
        setTitle(title, forState: .Normal)
        setBackgroundImage(UIImage(named: backImage), forState: .Normal)
        setBackgroundImage(UIImage(named: backImage + "_highlighted"), forState: .Highlighted)
        if color != nil {
            setTitleColor(color, forState: .Normal)
        }
        
    }
}
