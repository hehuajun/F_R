//
//  GuidViewController.swift
//  DZMeBookRead
//
//  Created by zyz on 17/1/18.
//  Copyright © 2017年 DZM. All rights reserved.
//

import Foundation
class GuidViewController:UIViewController{
    override func viewDidLoad() {
        let setupCellHandler:ZJLeadingPageSetupCellHandler? = {(cell, indexPath) -> () in
            
            // 设置图片
            let imageName = NSString.init(format: "wangyiyun%ld", (indexPath?.row)!)
            cell?.finishBtn.setTitle("立即体验", for: UIControlState.normal)
            cell?.finishBtn.setTitleColor(UIColor.green, for: UIControlState.normal)
        }
        
        // 如果是第一次安装打开App --- 显示引导页面
        let leadController = ZJLeadingPageController.init(pagesCount: 5, setupCellHandler: setupCellHandler, finishHandler: {(finishBtn :UIButton?) -> Void in
//        NSLog("点击了完成按钮-----");
        })
        // 自定义属性
        leadController?.pageControl.pageIndicatorTintColor = UIColor.yellow;
        leadController?.pageControl.currentPageIndicatorTintColor = UIColor.purple;
    }
}
