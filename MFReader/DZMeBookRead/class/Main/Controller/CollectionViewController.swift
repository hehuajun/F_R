//
//  CollectionViewController.swift
//  DZMeBookRead
//  首页的收藏
//  Created by zyz on 17/3/20.
//  Copyright © 2017年 DZM. All rights reserved.
//

import UIKit

private let reuseIdentifier = "collectionCellID"

class CollectionViewController: UICollectionViewController {
    
    // MARK: -- 成员变量
    var readVC:HJReadPageController!
    var bookDetailVC:BookDetailViewController!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.backgroundColor = UIColor.white
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        //间隔
        let spacing:CGFloat = 2
        //水平间隔
        layout.minimumInteritemSpacing = spacing
        //垂直行间距
        layout.minimumLineSpacing = spacing
        
        //列数
        let columnsNum = 3
        //整个view的宽度
        let collectionViewWidth = self.collectionView!.bounds.width
        //计算单元格的宽度
        let itemWidth = (collectionViewWidth - spacing * CGFloat(columnsNum-1))
            / CGFloat(columnsNum)
        //设置单元格宽度和高度
        layout.itemSize = CGSize(width:itemWidth, height:itemWidth*1.33)
        // Do any additional setup after loading the view.
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        self.tabBarController?.tabBar.isHidden = false
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "defaultCellID", for: indexPath)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.read()
    }
    // MARK: -- 内部事件
    func read() {
        /*
//        self.readVC!.readModel = HJReadModel.readModelWithFileName("求魔")
//        let rt = UIApplication.shared.keyWindow?.rootViewController as! UITabBarController
//        rt.hidesBottomBarWhenPushed = true
        self.hidesBottomBarWhenPushed = true
        self.parent?.hidesBottomBarWhenPushed = true
        
//        self.navigationController?.hidesBottomBarWhenPushed = true
//        self.tabBarController?.hidesBottomBarWhenPushed = true
//        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.pushViewController(UIViewController.init(), animated: true)
//        self.navigationController?.hidesBottomBarWhenPushed = false
        self.hidesBottomBarWhenPushed = false
        self.parent?.hidesBottomBarWhenPushed = false
//        rt.hidesBottomBarWhenPushed = false
//        self.tabBarController?.tabBar.isHidden = false
        return
        */
//        MBProgressHUD.showMessage("本地文件第一次解析慢,以后就会秒进了")
        //let fileURL = Bundle.main.url(forResource: "求魔", withExtension: "txt")
        readVC = HJReadPageController()
//        HJReadParser.separateLocalURL(fileURL!) { [weak self] (isOK) in
//            MBProgressHUD.hide()
//            if self != nil {
////                ws.readVC!.readModel = HJReadModel.readModelWithFileName("求魔")
////                ws.parent?.hidesBottomBarWhenPushed = true
////                ws.navigationController?.pushViewController(self!.readVC!, animated: true)
////                ws.parent?.hidesBottomBarWhenPushed = false
//                  self?.goContentVC()
//            }
//        }
        self.goBookDetail()
    }
    
    func goBookDetail() -> Void {
        bookDetailVC = UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(withIdentifier: "BookDetailViewController") as! BookDetailViewController
        
        self.parent?.hidesBottomBarWhenPushed = true
        self.parent?.navigationController?.pushViewController(bookDetailVC!, animated: true)
        //        self.parent?.navigationController?.pushViewController(self.readVC!, animated: true)
        self.parent?.hidesBottomBarWhenPushed = false
        
    }
    func goContentVC() -> Void {
        self.readVC!.readModel = HJReadModel.readModelWithFileName("求魔")
        self.parent?.hidesBottomBarWhenPushed = true
        self.parent?.navigationController?.pushViewController(self.readVC!, animated: true)
//        self.parent?.navigationController?.pushViewController(self.readVC!, animated: true)
        self.parent?.hidesBottomBarWhenPushed = false
        
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
