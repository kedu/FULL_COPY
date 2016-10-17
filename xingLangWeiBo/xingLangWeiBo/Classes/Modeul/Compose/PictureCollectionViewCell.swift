//
//  PictureCollectionViewCell.swift
//  xingLangWeiBo
//
//  Created by Apple on 16/10/15.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

import UIKit

class PictureCollectionViewCell: UICollectionViewCell {
    var tmp : UIImage?
//    当前cell对应的索引
    var indexPath : NSIndexPath?
    //设置图片 
    var iconImage : UIImage? {
        set{   tmp = newValue
            if tmp == nil {
            self.delegate.hidden = true
                //cell复用做处理

                self.addPic.setBackgroundImage(UIImage(named: "compose_emoticonbutton_background"), forState: .Normal)
                self.addPic.setBackgroundImage(UIImage(named: "compose_emoticonbutton_background_highlighted"), forState:.Highlighted)
            }else{
                self.delegate.hidden = false
               self.addPic.setBackgroundImage(tmp, forState: .Normal)}
        }
        get{
    
        return self.tmp
        }
    
    }
    //显示图片按钮
    @IBOutlet weak var addPic: UIButton!
    //删除按钮
    @IBOutlet weak var delegate: UIButton!
    //添加图片
    @IBAction func addPic(sender: AnyObject) {print("添加图片")
    NSNotificationCenter.defaultCenter().postNotificationName("addPic", object: nil)
        
    }
    //删除图片
    @IBAction func deletePic(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("deletePic", object: self)
        print("删除图片")
    }
}
