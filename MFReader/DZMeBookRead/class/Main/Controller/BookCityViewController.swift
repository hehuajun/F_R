//
//  BookCityController.swift
//  DZMeBookRead
//
//  Created by zyz on 17/3/20.
//  Copyright © 2017年 DZM. All rights reserved.
//

import UIKit
import WMPageController
import LLCycleScrollView

class BookCityViewController: WMPageController {
    
    var bannerHeight = HJConst.kScreenWidth * 0.66
    var wmpcBookCity:WMPageController!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewFrame = CGRect(x: 0, y: bannerHeight, width: HJConst.kScreenWidth, height: HJConst.kScreenHeight - bannerHeight - 49)
        self.menuViewLayoutMode = WMMenuViewLayoutMode.center;
        self.menuViewStyle = WMMenuViewStyle.line                //设置需要靠前，放到其他属性后面进行设置，容易被遮挡
        self.menuHeight = 44;
        self.delegate = self
        self.dataSource = self
        self.pageAnimatable = true
        self.view.backgroundColor = UIColor.white
        self.postNotification = true
        self.bounces = true
        self.title = "书城"
        self.setupBanner(view: self.view)
        
        let selectedImage = UIImage.init(named: "书城(1)")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        self.tabBarItem = UITabBarItem(title: "书城", image: UIImage.init(named: "书城"), selectedImage: selectedImage)
        
//        self.tabBarItem.selectedImage = selectedImage
//        self.tabBarItem.image = UIImage.init(named: "书城")
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    
//    func getBookCity() -> UINavigationController{
//        //        let vcs = NSArray.init(objects:TBLRcmdInMainVC.classForCoder(),TBLRcmdInMainVC.classForCoder(),TBLRcmdInMainVC.classForCoder(),TBLRcmdInMainVC.classForCoder(),TBLRcmdInMainVC.classForCoder(),TBLRcmdInMainVC.classForCoder())
//        //        let titles = NSArray.init(objects: "推荐","男生","女生","热更","排行","完本")
//        wmpcBookCity = WMPageController.init()
//        wmpcBookCity.viewFrame = CGRect(x: 0, y: bannerHeight, width: HJConst.kScreenWidth, height: HJConst.kScreenHeight - bannerHeight - 49)
//        wmpcBookCity.menuViewLayoutMode = WMMenuViewLayoutMode.center;
//        wmpcBookCity.menuViewStyle = WMMenuViewStyle.line                //设置需要靠前，放到其他属性后面进行设置，容易被遮挡
//        wmpcBookCity.menuHeight = 44
//        wmpcBookCity.delegate = self
//        wmpcBookCity.dataSource = self
//        wmpcBookCity.pageAnimatable = true
//        wmpcBookCity.view.backgroundColor = UIColor.white
//        wmpcBookCity.postNotification = true
//        wmpcBookCity.bounces = true
//        wmpcBookCity.title = "书城"
//        self.setupBanner(view: wmpcBookCity.view)
//        
//        let navVC = UINavigationController(rootViewController:wmpcBookCity)
//        let selectedImage = UIImage.init(named: "书城(1)")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
//        wmpcBookCity.tabBarItem = UITabBarItem(title: "书城", image: UIImage.init(named: "书城"), selectedImage: selectedImage)
//        
//        return navVC
//    }
    
    
    // MARK: -- WMPageControllerDelegate
    override func pageController(_ pageController: WMPageController, didEnter viewController: UIViewController, withInfo info: [AnyHashable : Any]) {
        print("hello")
    }
    
    override func numbersOfChildControllers(in pageController: WMPageController) -> Int {
        return 4
    }
    override func pageController(_ pageController: WMPageController, viewControllerAt index: Int) -> UIViewController {
        var vc:UIViewController
        switch index {
        case 0:
            vc = UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(withIdentifier: "HistoryRecordViewController")
        case 1:
            vc = UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(withIdentifier: "HistoryRecordViewController")
        case 2:
            vc = UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(withIdentifier: "HistoryRecordViewController")
        default:
            vc = UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(withIdentifier: "HistoryRecordViewController")
        }
        return vc;
    }
    override func pageController(_ pageController: WMPageController, titleAt index: Int) -> String {
        if index == 0{
            return "收藏"
        }else if index  == 1 {
            return "历史"
        }else{
            return "下载"
        }
    }
    
    func setupBanner(view:UIView) -> Void {
        let scrollView: UIScrollView! = UIScrollView.init(frame: CGRect(x: 0, y: 0, width: HJConst.kScreenWidth, height: bannerHeight))
        // 网络图，本地图混合
        let imagesURLStrings = [
            "1.jpg",
            "https://segmentfault.com/img/bVpWTi",
            "http://img2.zjolcdn.com/pic/0/13/66/56/13665652_914292.jpg",
            "http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
            "http://img3.redocn.com/tupian/20150806/weimeisheyingtupian_4779232.jpg",
            ];
        
        // 图片配文字
        let titles = ["感谢您的支持",
                      "如果代码在使用过程中出现问题",
                      "您可以发邮件到coderjianfeng@foxmail.com",
                      ];
        
        let bannerDemo = LLCycleScrollView.llCycleScrollViewWithFrame(CGRect.init(x: 0, y: 64, width: HJConst.kScreenWidth, height: bannerHeight - 64), imageURLPaths: imagesURLStrings, titles:titles, didSelectItemAtIndex: { index in
            print("当前点击图片的位置为:\(index)")
        })
        //        bannerDemo.imageViewContentMode = UIViewContentMode.scaleAspectFit
        bannerDemo.customPageControlStyle = .pill
        bannerDemo.customPageControlInActiveTintColor = UIColor.red
        scrollView.addSubview(bannerDemo)
        view.addSubview(scrollView)
    }
}
