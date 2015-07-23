//
//  AJParallaxEffectViewController.swift
//  AJParallaxEffect
//
//  Created by Arvind Joshi on 11/07/15.
//  Copyright (c) 2015 Arvind Joshi. All rights reserved.
//

import UIKit

class AJParallaxEffectViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet var collectionView: UICollectionView!
    var dataDict :  [NSDictionary] = [["PromoImage":"promo1.jpg","PromoTitle":"Life is easy, Just need to walk with it","PromoSubtitle":"AJ"],
        ["PromoImage":"promo2.jpg","PromoTitle":"Regularity of best practice is key to success","PromoSubtitle":"AJ"],
        ["PromoImage":"promo3.jpg","PromoTitle":"Title3","PromoSubtitle":"Subtitle3"],
        ["PromoImage":"promo4.jpg","PromoTitle":"Title4","PromoSubtitle":"Subtitle4"],
        ["PromoImage":"promo5.jpg","PromoTitle":"Title5","PromoSubtitle":"Subtitle5"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView!.dataSource = self
        collectionView!.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - ScrollView Delegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // Load the pages that are now on screen
        
        if var visiblePaths = self.collectionView.indexPathsForVisibleItems() as? [AnyObject]{
            if visiblePaths.count > 0 {
                
                if visiblePaths.count > 1{
                    
                    var cell = self.collectionView.cellForItemAtIndexPath(visiblePaths[0] as! NSIndexPath)
                    var cell1 = self.collectionView.cellForItemAtIndexPath(visiblePaths[1] as! NSIndexPath)
                    if cell?.frame.origin.x < cell1?.frame.origin.x{
                        if cell!.alpha > 0.6{
                            
                            cell!.alpha = cell!.alpha - 0.01
                        }
                        cell1!.alpha = 1
                    }else{
                        cell!.alpha = 1
                        if cell1!.alpha > 0.6{
                            cell1!.alpha = cell1!.alpha - 0.01
                        }
                    }
                }
            }
        }
        
        if var visibleCells = self.collectionView.visibleCells() as? [ParallaxCollectionViewCell]{
            for view in visibleCells{
                
                var xOffsetDiff = self.collectionView.contentOffset.x - view.frame.origin.x
                var xOffset : CGFloat = (xOffsetDiff / kScreenWidth) * (kScreenWidth/2)
                view.setViewOffset(CGPointMake(xOffset, 30.0))
            }
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        if var visiblePaths = self.collectionView.indexPathsForVisibleItems() as? [AnyObject]{
            if visiblePaths.count > 0 {
                
                if visiblePaths.count > 1{
                    
                    var cell = self.collectionView.cellForItemAtIndexPath(visiblePaths[0] as! NSIndexPath)
                    var cell1 = self.collectionView.cellForItemAtIndexPath(visiblePaths[1] as! NSIndexPath)
                    if cell?.frame.origin.x < cell1?.frame.origin.x{
                        if cell!.alpha > 0.6{
                            cell!.alpha = cell!.alpha - 0.01
                        }
                        cell1!.alpha = 1
                    }else{
                        cell!.alpha = 1
                        if cell1!.alpha > 0.6{
                            cell1!.alpha = cell1!.alpha - 0.01
                        }
                    }
                    
                }else{
                    var cell = self.collectionView.cellForItemAtIndexPath(visiblePaths[0] as! NSIndexPath)
                    cell!.alpha = 1
                }
            }
        }
    }
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        if var visiblePaths = self.collectionView.indexPathsForVisibleItems() as? [AnyObject]{
            var cell = self.collectionView.cellForItemAtIndexPath(visiblePaths[0] as! NSIndexPath)
            cell!.alpha = 1
        }
    }

    
    
    //MARK: CollectionView Data Source
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.dataDict.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(kScreenWidth, kScreenHeight)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell : ParallaxCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("ParallaxCollectionViewCell", forIndexPath: indexPath) as! ParallaxCollectionViewCell
        var dict = self.dataDict[indexPath.row] as NSDictionary
        var image : UIImage = UIImage(named: dict["PromoImage"] as! String)!
        cell.imgImage?.image = image
        cell.lblTitle?.text = dict["PromoTitle"] as! String
        cell.lblSubtitle?.text = dict["PromoSubtitle"] as! String
        cell.alpha = 1.0
        var xOffSet : CGFloat = (self.collectionView.contentOffset.x - cell.frame.origin.x)
        var xoffsetn : CGFloat = (xOffSet / kScreenWidth) * (kScreenWidth/2)
        cell.offSetPoint = CGPointMake(xoffsetn, 30.0)
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
    }

}
