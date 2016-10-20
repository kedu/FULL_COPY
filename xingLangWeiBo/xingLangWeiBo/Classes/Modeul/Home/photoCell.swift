//
//  photoCell.swift
//  xingLangWeiBo
//
//  Created by Apple on 16/10/20.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

import UIKit

class photoCell: UICollectionViewCell {
    var imageUrl_tmp : NSURL?
    var imageUrl : NSURL? {
        set{imageUrl_tmp = newValue
            peitu.setImageWithURL(imageUrl_tmp!, placeholderImage: UIImage(named: "avatar_default_big"))
            if ((imageUrl_tmp?.absoluteString.lowercaseString.hasSuffix(".gif")) == true){
            gif.hidden = false
            
            } else {
            gif.hidden = true
            }

}       get {

return imageUrl_tmp
}
    
    
    }
    @IBOutlet weak var peitu: UIImageView!

    @IBOutlet weak var gif: UIImageView!
    

    }
