//
//  toolbarView.swift
//  xingLangWeiBo
//
//  Created by Apple on 16/10/15.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

import UIKit

class toolbarView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
     
        setup()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup(){
    //1.创建五个按钮
        setupBtn("compose_toolbar_picture", hightImage: "compose_toolbar_picture_highlighted")
         setupBtn("compose_mentionbutton_background", hightImage: "compose_mentionbutton_background_highlighted")
         setupBtn("compose_trendbutton_background", hightImage: "compose_trendbutton_background_highlighted")
         setupBtn("compose_emoticonbutton_background", hightImage: "compose_emoticonbutton_background_highlighted")
         setupBtn("compose_keyboardbutton_background", hightImage: "compose_keyboardbutton_background_highlighted")
        
       
    
    }
    override func layoutSubviews() {
     //调整五个按钮的frame
        let Allwidth = self.frame.width
        let count = self.subviews.count
        let width = Allwidth/CGFloat(count)
        
        for var  i=0 ; i<count ;i++ {
            let btn = subviews[i] as! UIButton
            let x = CGFloat(i) * width
            btn.frame = CGRect(x: x, y: 0, width: width, height: self.frame.height)
    
        
        }
    }
    func setupBtn(image : NSString? , hightImage : NSString?){
       let btn = UIButton()
        btn.setImage(UIImage(named: image! as String), forState: .Normal)
    
       btn.setImage(UIImage(named: hightImage! as String), forState: .Highlighted)
        btn.addTarget(self, action: "btnClick", forControlEvents: .TouchUpInside)
    addSubview(btn)
    
    
    
    }
}
