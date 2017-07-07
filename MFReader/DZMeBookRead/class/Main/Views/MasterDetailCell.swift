//
//  MasterDetailCell.swift
//  DZMeBookRead
//
//  Created by hehuajun on 2017/7/6.
//  Copyright © 2017年 DZM. All rights reserved.
//

import UIKit

class MasterDetailCell: UITableViewCell {

    @IBOutlet weak var ivLogol: UIImageView!
    @IBOutlet weak var lblMasterTitle: UILabel!
    @IBOutlet weak var lblDetailTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
