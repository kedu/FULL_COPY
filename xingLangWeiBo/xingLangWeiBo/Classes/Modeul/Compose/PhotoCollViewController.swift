//
//  PhotoCollViewController.swift
//  xingLangWeiBo
//
//  Created by Apple on 16/10/15.
//  Copyright © 2016年 lkb-求工作qq:1218773641. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"


class PhotoCollViewController: UICollectionViewController {
    //布局
    @IBOutlet weak var flow: UICollectionViewFlowLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        //初始化item
        // Register cell classes
//        self.collectionView!.registerClass(PictureCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        

        //通知
        
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
        return 100
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //取出cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
        //设置数据
        cell.backgroundColor = UIColor.orangeColor()
        //返回cell
       print(cell.contentView.subviews)
        return cell
    }

    override func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        print("cell被点击了")
        
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
