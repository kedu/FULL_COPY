//
//  MainTabBar.swift
//  xingLangWeiBo
//
//  Created by Apple on 16/10/8.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

import UIKit

class MainTabBar: UITabBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
//如果重写init,系统会认为这个控件是通过代码创建
    required init?(coder aDecoder: NSCoder) {
        //只有默认报错语句
        super.init(coder: aDecoder)
        //如果通过xib,sb创建了该对象,这个时候程序会崩溃
//        fatalError("init(coder:) has not been implemented")
        
        
    }
    override func layoutSubviews() {
      super.layoutSubviews()
       let w=self.bounds.width/5
        let h=self.bounds.height
        let  rect=CGRect(x: 0, y: 0, width: w, height: h)
        var index : CGFloat = 0
        for  subView in subviews{
//             print(subView)
            if subView.isKindOfClass(NSClassFromString("UITabBarButton")!){
                //修改frame
                subView.frame=CGRectOffset(rect, w*index, 0)
//                if index==1 {
//                
//                index++}
//                index++
                //
                index+=index==1 ? 2 : 1
                
            }
        
        }
        composeBtn.frame=CGRectOffset(rect, w*2, 0)
//        bringSubviewToFront(composeBtn)
        
    }
    private func setupUI(){
    
    addSubview(composeBtn)
    
    
    }
    //懒加载
    lazy var composeBtn: UIButton = {
    let btn=UIButton()
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        btn.sizeToFit()
        return btn
    }()
    

    
}
