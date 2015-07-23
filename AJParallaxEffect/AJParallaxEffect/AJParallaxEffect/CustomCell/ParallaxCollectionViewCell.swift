//
//  ParallaxCollectionViewCell.swift
//  AJParallaxEffect
//
//  Created by Arvind Joshi on 11/07/15.
//  Copyright (c) 2015 Arvind Joshi. All rights reserved.
//

import UIKit

class ParallaxCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var lblTitle : UILabel?
    @IBOutlet var lblSubtitle : UILabel?
    @IBOutlet var imgImage : UIImageView?
    @IBOutlet var parentView : UIView?
    var offSetPoint : CGPoint?
    
    func setViewOffset(offset : CGPoint){
        
        offSetPoint = offset
        
        var frame : CGRect = self.parentView!.bounds
        var offSetFrame = CGRectOffset(frame, offset.x, offset.y)
        self.parentView!.frame = offSetFrame
    }
    
    
}
