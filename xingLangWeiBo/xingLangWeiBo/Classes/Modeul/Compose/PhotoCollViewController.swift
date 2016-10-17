//
//  PhotoCollViewController.swift
//  xingLangWeiBo
//
//  Created by Apple on 16/10/15.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotoCollViewController: UICollectionViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    lazy var images : NSMutableArray = {
    let IM = NSMutableArray()
        return IM
    
    }()
    //布局
    @IBOutlet weak var flow: UICollectionViewFlowLayout!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        //初始化item

        //通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "addPic", name: "addPic", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "deletePic:", name: "deletePic", object: nil)
        
    }
    //选中图片
      func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
    let image = info[UIImagePickerControllerOriginalImage]
        images.addObject(image!)
        self.collectionView?.reloadData()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
   //取消
      func imagePickerControllerDidCancel(picker: UIImagePickerController){
       picker.dismissViewControllerAnimated(true, completion: nil)
    }
    //添加图片
    func addPic(){
        let picVC = UIImagePickerController()
        picVC.delegate = self
        presentViewController(picVC, animated: true, completion: nil)
        
        
    }
    //删除图片
    func deletePic(note : NSNotification){
   let cell = note.object
    images.removeObjectAtIndex(cell!.indexPath.item)

        
    collectionView?.reloadData()
    
    
    }
    override func viewWillLayoutSubviews() {
        //初始化item
        //设置水平,垂直,全局间隙
        flow.minimumLineSpacing = 10
        flow.minimumInteritemSpacing = 10
        flow.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 5, right: 10)
        //设置全局itemsize
        let col :CGFloat = 3
        let wid = (view.frame.width - ((col+1)*10 as? CGFloat)! )/3.0
        flow.itemSize = CGSize(width: wid, height: wid)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
 

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.images.count+1
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //取出cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PictureCollectionViewCell
        //设置数据
        cell.backgroundColor = UIColor.orangeColor()
         print("images.count\(images.count)")
           print("indexPath.item\(indexPath.item)")
        if images.count == indexPath.item {
            cell.iconImage = nil
           
        } else {
            cell.iconImage = (images[indexPath.item] as? UIImage)
            cell.indexPath = indexPath
            
        }
        //返回cell
       print(cell.contentView.subviews)
        return cell
    }
    deinit{
      NSNotificationCenter.defaultCenter().removeObserver(self)
    
    
    
    }
}
