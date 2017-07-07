//
//  TVCCollection.swift
//  DZMeBookRead
//
//  Created by zyz on 17/3/20.
//  Copyright © 2017年 DZM. All rights reserved.
//

import UIKit

class TVCCollection: UICollectionViewCell {

    @IBOutlet weak var lblUpdateState: UILabel!
    @IBOutlet weak var lblNovelName: UILabel!
    @IBOutlet weak var ivCover: UIImageView!
  
    override init(frame:CGRect) {
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    func setViewLabel(index:NSIndexPath){
        self.lblNovelName.text = "NovelName"
        self.lblUpdateState.text = "已经最新"
    }
}
