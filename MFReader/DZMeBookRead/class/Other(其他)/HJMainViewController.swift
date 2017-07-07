//
//  HJMainViewController.swift
//  DZMeBookRead
//
//  Created by 邓泽淼 on 16/8/31.
//  Copyright © 2016年 DZM. All rights reserved.
//

import UIKit
import SnapKit
import WMPageController

class HJMainViewController: UIViewController,MBProgressHUDDelegate,YAScrollSegmentControlDelegate {

    func test() -> () {
        view.makeToast("");
    }
    
    var readVC:HJReadPageController!
    var segmentControl:YAScrollSegmentControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func read() {
        // 方法一
        MBProgressHUD.showMessage("本地文件第一次解析慢,以后就会秒进了")
        
        let fileURL = Bundle.main.url(forResource: "求魔", withExtension: "txt")
        
        readVC = HJReadPageController()
        
        HJReadParser.separateLocalURL(fileURL!) { [weak self] (isOK) in
            
             MBProgressHUD.hide()
            
            if self != nil {
                
                self!.readVC!.readModel = HJReadModel.readModelWithFileName("求魔")
                
                self!.navigationController?.pushViewController(self!.readVC!, animated: true)
                
            }
        }
        
        // 方法一
        
//        MBProgressHUD.showMessage()
//        
//        let fileURL = NSBundle.mainBundle().URLForResource("求魔", withExtension: "txt")
//
//        let readVC = HJReadPageController()
//        
//        dispatch_async(dispatch_get_global_queue(0, 0)) {
//            
//            readVC.readModel = HJReadModel.readModelWithLocalBook(fileURL!)
//            
//            dispatch_async(dispatch_get_main_queue(), { [weak self] ()->() in
//                
//                MBProgressHUD.hideHUD()
//                
//                self?.navigationController?.pushViewController(readVC, animated: true)
//                })
//        }
    }
    func testSegment() -> Void {
        self.navigationController?.pushViewController(self.setupSegentControl(), animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setup() -> () {
        view.backgroundColor = UIColor.white
        let frame:CGRect = CGRect(x:0, y:60, width:UIScreen.main.bounds.width, height:44)
        segmentControl = YAScrollSegmentControl.init(frame: frame);
        segmentControl.buttons = HJNavModel.sharedInstance.novelChannels
        segmentControl.delegate = self;
        view.addSubview(segmentControl)
        
//        segmentControl.snp.makeConstraints({ (make) in
//            make.top.equalTo(view).offset(64)
//            make.centerX.equalTo(view)
//            make.width.equalTo(view)
//            make.height.equalTo(44)
//        })
        
        let button = UIButton(type:UIButtonType.custom)
        button.setTitle("点击阅读", for: UIControlState())
        button.backgroundColor = UIColor.green
        view.addSubview(button)
        button.addTarget(self, action: #selector(HJMainViewController.testSegment), for: UIControlEvents.touchDown)
        
        button.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view)
            make.width.height.equalTo(100)
        }
        
    }
    // MARK: -- Create SegmentControler
    
    func setupSegentControl() -> WMPageController {
        let vcs = NSArray.init(objects:UIViewController.classForCoder(),UIViewController.classForCoder(),UIViewController.classForCoder())
        let titles = NSArray.init(objects: "第一个","第二个","第三个")
        let vc = WMPageController.init(viewControllerClasses:vcs as! [AnyClass], andTheirTitles: titles as! [String])
        vc?.menuViewLayoutMode = WMMenuViewLayoutMode.center;
        vc?.view.backgroundColor = UIColor.init(colorLiteralRed: Float(arc4random_uniform(255))/255.0, green: Float(arc4random_uniform(255))/255.0, blue: Float(arc4random_uniform(255))/255.0, alpha: 1)
        vc?.menuItemWidth = 85;
        vc?.postNotification = true
        vc?.bounces = true
        vc?.hidesBottomBarWhenPushed = true
        return vc!
    }
    
    // MARK: -- YAScrollSegementControlDelegate
    
    func didSelectItem(at index: Int) {
        
    }
}
