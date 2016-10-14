//
//  InputView.swift
//  xingLangWeiBo
//
//  Created by Apple on 16/10/14.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

import UIKit

class InputView: UITextView {
    var placeholder : String?
    var placeholderLabel: UILabel?

    override func drawRect(rect: CGRect) {
        // Drawing code
//        let textf = UITextField(frame: view.bounds)
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
    func textchange(){
       placeholderLabel?.hidden = (self.text.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)>0)

//        self.text.characters.count
        
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
