//
//  BookInfoCell.swift
//  DZMeBookRead
//
//  Created by hehuajun on 2017/7/6.
//  Copyright © 2017年 DZM. All rights reserved.
//

import UIKit

class BookInfoCell: UITableViewCell {

    @IBOutlet weak var ivBookCover: UIImageView!
    @IBOutlet weak var lblBookName: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblBookType: UILabel!
    @IBOutlet weak var lblUpdateStatus: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
