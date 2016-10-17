//
//  InputView.swift
//  xingLangWeiBo
//
//  Created by Apple on 16/10/14.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

import UIKit

class InputView: UITextView {
//    var placeholder : String?
    var placeholderLabel: UILabel?
    override func drawRect(rect: CGRect) {

    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        let  placeholderLabel = UILabel()
        placeholderLabel.numberOfLines = 0
        placeholderLabel.text = "请输入文字"
        placeholderLabel.sizeToFit()
        font = UIFont.systemFontOfSize(15)
        placeholderLabel.font = font
        addSubview(placeholderLabel)
        self.placeholderLabel = placeholderLabel
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textchange", name: UITextViewTextDidChangeNotification, object: nil)

        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        autoresizesSubviews = false
         placeholderLabel!.frame = CGRect(x: 0, y: 0, width: 375, height: 50)
        
//        addConstraint(NSLayoutConstraint(item: placeholderLabel!, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: 0))
        
        
    }
    func textchange(){
       placeholderLabel?.hidden = (self.text.characters.count>0)

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
//        super.init(coder: aDecoder)
    }


}
