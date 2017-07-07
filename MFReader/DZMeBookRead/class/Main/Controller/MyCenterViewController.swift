//
//  MyCenterViewController.swift
//  DZMeBookRead
//
//  Created by zyz on 17/3/20.
//  Copyright © 2017年 DZM. All rights reserved.
//

import UIKit
import WMPageController
import LLCycleScrollView

class MyCenterViewController: WMPageController{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        self.menuViewLayoutMode = WMMenuViewLayoutMode.center
        self.titleColorSelected = HJConst.kThemeColr
        self.progressColor = HJConst.kThemeColr
        self.menuViewStyle = WMMenuViewStyle.line
        self.view.backgroundColor = UIColor.white
        self.menuHeight = 44
        self.pageAnimatable = true
        self.menuItemWidth = HJConst.kScreenWidth/3;
        self.postNotification = true
        self.bounces = true
        self.title = "书城"
        let selectedImage = UIImage.init(named: "主页(1)")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        self.tabBarItem = UITabBarItem(title: "我的", image: UIImage.init(named: "主页"), selectedImage: selectedImage)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
//    func getHomeVC() -> UINavigationController{
//        let wmpcHome = WMPageController.init()
//        wmpcHome.delegate = self
//        wmpcHome.dataSource = self
//        wmpcHome.menuViewLayoutMode = WMMenuViewLayoutMode.center
//        wmpcHome.titleColorSelected = HJConst.kThemeColr
//        wmpcHome.progressColor = HJConst.kThemeColr
//        wmpcHome.menuViewStyle = WMMenuViewStyle.line
//        wmpcHome.view.backgroundColor = UIColor.white
//        wmpcHome.menuHeight = 44;
//        wmpcHome.pageAnimatable = true
//        wmpcHome.menuItemWidth = HJConst.kScreenWidth/3;
//        wmpcHome.postNotification = true
//        wmpcHome.bounces = true
//        wmpcHome.title = "书城"
//        let navVC = UINavigationController(rootViewController:wmpcHome)
//        let selectedImage = UIImage.init(named: "主页(1)")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
//        wmpcHome.tabBarItem = UITabBarItem(title: "我的", image: UIImage.init(named: "主页"), selectedImage: selectedImage)
//        
//        return navVC
//    }
    override func numbersOfChildControllers(in pageController: WMPageController) -> Int {
        return 4
    }
    override func pageController(_ pageController: WMPageController, viewControllerAt index: Int) -> UIViewController {
        var vc:UIViewController
        switch index {
        case 0:
            vc = UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(withIdentifier: "CollectionViewController")
        case 1:
            vc = UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(withIdentifier: "CollectionViewController")
        case 2:
            vc = UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(withIdentifier: "CollectionViewController")
        default:
            vc = UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(withIdentifier: "CollectionViewController")
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
}
