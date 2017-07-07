//
//  TBLBookDetailInfo.swift
//  DZMeBookRead
//
//  Created by zyz on 17/4/1.
//  Copyright © 2017年 DZM. All rights reserved.
//

import UIKit

class TBLBookDetailInfo: UITableViewCell {
    @IBOutlet weak var ivBookCover:UIImageView!
    
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblUpdateState: UILabel!
    @IBOutlet weak var lblBookType: UILabel!
    @IBOutlet weak var lblAuthorName: UILabel!
    @IBOutlet weak var lblBookName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
