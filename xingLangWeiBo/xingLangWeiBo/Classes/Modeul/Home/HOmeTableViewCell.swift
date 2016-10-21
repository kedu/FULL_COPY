//
//  HOmeTableViewCell.swift
//  xingLangWeiBo
//
//  Created by Apple on 16/10/18.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

import UIKit

class HOmeTableViewCell: UITableViewCell {
    @IBOutlet weak var for_other_conView: UIView!
    @IBOutlet weak var for_other: UILabel!
    @IBOutlet weak var for_other_height: NSLayoutConstraint!
//配图容器
    @IBOutlet weak var collectView: UICollectionView!
    //配图高度
    @IBOutlet weak var phontoHeight: NSLayoutConstraint!
    @IBOutlet weak var verImageview: UIImageView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var vip: UIImageView!
    @IBOutlet weak var creat_time: UILabel!
    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var contentText: UILabel!
    @IBOutlet weak var weibocellheigeht: NSLayoutConstraint!
    //转发容器
    @IBOutlet weak var for_other_collectView: UICollectionView!
    //转发配图高度
    @IBOutlet weak var for_other_phontoHeight: NSLayoutConstraint!
    var isFor_other : Bool?
    var homeModel_tmp : HomeModel?
    //数据模型
    var homeModel : HomeModel? {
        set{
           homeModel_tmp = newValue
            if homeModel_tmp != nil {
                //头像
                let url = NSURL(string: (homeModel_tmp?.profile_image_url)!)
                icon.layer.masksToBounds = true
                icon.layer.cornerRadius = 25
                icon.layer.borderWidth = 0.2
                icon.layer.borderColor = UIColor.whiteColor().CGColor
                
                icon.setImageWithURL(url!, placeholderImage: UIImage(named:"compose_keyboardbutton_background_highlighted" ))
                //昵称
                name.text = homeModel_tmp!.name
                //会员图标
                vip.hidden = false
                let tORf = homeModel_tmp?.isVip()
                if (tORf != false) {
                    let rangk = homeModel_tmp?.mbrank
                    let nameStr = NSString(string: "common_icon_membership_level\(rangk!)")
                
                    vip.image = UIImage(named: nameStr as String)
                  name.textColor = UIColor.orangeColor()
                }else if (tORf == false){
//                    let nameStr = NSString(string: "common_icon_membership_expired")
                    vip.hidden = true
//
//                    vip.image = UIImage(named: nameStr as String)
                    name.textColor = UIColor.grayColor()
                }
                //认证
                verImageview.hidden = false
                switch(Int((homeModel_tmp?.verified_level)!)){
                case 0://个人
                    verImageview.image = UIImage(named: "avatar_vip")
                    break
                case 2:
                    verImageview.image = UIImage(named: "avatar_enterprise_vip")
                    break
                case 3:
                    verImageview.image = UIImage(named: "avatar_enterprise_vip")
                    break
                case 5: verImageview.image = UIImage(named: "avatar_enterprise_vip")
                    break
                case 220: verImageview.image = UIImage(named: "avatar_grassroot")
                    break
                default:
                    verImageview.hidden = true
                    break
                
                }
                //时间
                 creat_time.text = dealwith((homeModel_tmp?.created_at)!)
//                需要先处理一下
                //正文
                contentText.text = homeModel_tmp?.text
                contentText.sizeToFit()
//                print(contentText.text)
                //来源
                if ( homeModel_tmp?.source !=  ""){
                source.text = dealwithSource( (homeModel_tmp?.source)!) as String}else{
                source.text = "未通过审核应用"

}
//                print(source.text! + "是source")
                //正文的高度
                let conHeight = contentText.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
                //原创微博的高度
                weibocellheigeht.constant = contentText.frame.origin.y + conHeight
                //配图
                if (homeModel_tmp?.pic_urls?.count > 0){
                    let count = homeModel_tmp?.pic_urls?.count
                    var row = 0
                //行数
                    if (count! % 3 == 0){
                    row = count!/3
                    }else {
                    row = count!/3+1
                    }
                    //高度
                    let tmp = (row*70 + (row-1)*10)
                    phontoHeight.constant  = CGFloat(tmp)
                    
                     weibocellheigeht.constant = weibocellheigeht.constant + phontoHeight.constant + 10

                    //加载
                    collectView.reloadData()

                    
                    
                }else{
                //没有
                    phontoHeight.constant = 0
                

                }
                //转发微博
                //是否转发
                let iszf = (homeModel_tmp!.retweeted_status == nil)
                if ((iszf) == true){
                    for_other.hidden = true
                    for_other_height.constant = 0
                    isFor_other = false
                    
                }else {
                    isFor_other = true
                    for_other.hidden = false
                    let str = homeModel_tmp!.retweeted_status?["user"]!["name"] as! String + ":" + ((homeModel_tmp!.retweeted_status?["text"])! as! String) as! String
              for_other.text = str
                    print(for_other.text)
                    //高度
                for_other_height.constant = for_other.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height + 10
                    
                    //转发配图
                    let source = homeModel_tmp?.retweeted_status?["pic_urls"]
                    if (source!.count > 0){
                        let count = source!.count
                        var row = 0
                        //行数
                        if (count! % 3 == 0){
                            row = count!/3
                        }else {
                            row = count!/3+1
                        }
                        //高度
                        let tmp = (row*70 + (row-1)*10)
                        for_other_phontoHeight.constant  = CGFloat(tmp)
                        
                        for_other_height.constant = for_other_height.constant + for_other_phontoHeight.constant + 10
                        
                        //加载
                        for_other_collectView.reloadData()
                        
                        
                        
                    }else{
                        //没有
                        for_other_phontoHeight.constant = 0
                        
                        
                    }

                    
                    
                    

}
               
                
            
                

}
            
        }
        get{
        
        
        return nil
        }
    
    
    }
    func dealwithSource(var source_str:NSString) -> NSString{
    
        // 1.计算从什么地方开始截取
        let startRange = source_str.rangeOfString(">") 
        let startIndex = startRange.location + 1
        // 2.计算截取的长度
        //#warning rangeOfString方法会从字符串的开头开始查找, 只要查找到第一个就不会继续查找
        let endRange  = source_str.rangeOfString("</")
        let length = endRange.location - startIndex
        // 3.截取字符串
        if (startRange.location != NSNotFound &&
            endRange.location != NSNotFound) {
                let resultStr = source_str .substringWithRange(NSMakeRange(startIndex, length) )
                source_str = resultStr;
        }
        return source_str
    
    
    }
    func dealwith(string : String) -> String {
//

        let formatter = NSDateFormatter()
//        #warning 注意: 如果是真机, 还需要设置时间所属的区域
        formatter.locale = NSLocale(localeIdentifier: "en_US")
//        // 指定服务器返回时间的格式
//        // Mon Feb 02 18:15:20 +0800 2015
        formatter.dateFormat = "EEE MMM  dd HH:mm:ss Z yyyy"
     // 1.将服务器返回的字符串转换为NSDate
        let createdDate = formatter.dateFromString(string)!
 
//        // 2.判断服务器返回的时间, 根据时间返回对应的字符串
        if createdDate.isThisYear() {
            if createdDate.isToday(){
                let comps = createdDate.deltaWithNow
                if comps().hour >= 1 {
                
                 
                return "\(comps().hour)小时前"
                }else if comps().minute > 1 {
                return "\(comps().minute )分钟以前"
                
                }else {
                return "刚刚"
                
                }

            
            
            }else if createdDate.isYesterday() {
              formatter.dateFormat = "昨天 HH时:mm分"
                return formatter.stringFromDate(createdDate)
            }else {
                                formatter.dateFormat = "MM月dd日  HH时:mm分"
                                return formatter.stringFromDate(createdDate)
            
            }
        
  
        
        }else{
            formatter.dateFormat = "yy年MM月dd日 HH时:mm分"
                        return formatter.stringFromDate(createdDate)
        
        }

    }
    var status : IWStatus?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //设置原创微博正文最大的宽度
        let screenWith = UIScreen.mainScreen().bounds.size.width
        contentText.preferredMaxLayoutWidth = screenWith - 10
        for_other.preferredMaxLayoutWidth = screenWith - 10
    }
    //获取指定行数据cell的高度
    func cellHeightWithHomeModel(homeModel:HomeModel?) -> CGFloat{
      self.homeModel = homeModel
        layoutIfNeeded()
        //计算高度
        let iszf = (homeModel_tmp!.retweeted_status == nil)
        if ((iszf) == true){
        
         return weibocellheigeht.constant+10
        }else{
        
        let height = for_other_conView.frame.origin.y + for_other_height.constant + 10
        return height
        }
    
    }

    //为重用cell做准备
    override func prepareForReuse() {
        homeModel = nil
        
        
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension HOmeTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
   
        let source = homeModel_tmp?.retweeted_status?["pic_urls"]

        if (isFor_other == true){
             return source!.count
        }else {
            if (homeModel_tmp?.pic_urls != nil){
                return (homeModel_tmp?.pic_urls?.count)!
            }else {
                return 0
            }
        }
     
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
      
         let source = homeModel_tmp?.retweeted_status?["pic_urls"]
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("photoCell", forIndexPath: indexPath) as! photoCell
        if (isFor_other == true){
         
            let urlStr = source![indexPath.item]["thumbnail_pic"] as! String
            cell.imageUrl = NSURL(string: urlStr )

        
        }else{
            
            if (homeModel_tmp?.pic_urls != nil){
                let urlStr = homeModel_tmp?.pic_urls![indexPath.item]["thumbnail_pic"] as! String
                //             print(urlStr)
                cell.imageUrl = NSURL(string: urlStr )
            }
            
        }
        

        
        
        return cell

        

    }
    
    
    
    
    
    
}
