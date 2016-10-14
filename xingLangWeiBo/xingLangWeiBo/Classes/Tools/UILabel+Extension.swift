//
//  UILabel+Extension.swift
//  SinaWeibo
//
//  Created by apple on 15/11/12.
//  Copyright © 2015年 apple. All rights reserved.
//

import UIKit

//UILabel扩展

extension UILabel {
    
    
    //1.>文字
    //2.>文字大小
    //3.>文字的颜色
    convenience init(title: String,size: CGFloat,color: UIColor) {
        self.init()
        text = title
        textAlignment = NSTextAlignment.Center
        font = UIFont.systemFontOfSize(size)
        textColor = color
        numberOfLines = 0
        //设置大小
        sizeToFit()
    }
}