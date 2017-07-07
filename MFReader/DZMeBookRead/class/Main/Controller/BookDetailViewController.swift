//
//  BookDetailViewController.swift
//  DZMeBookRead
//
//  Created by zyz on 17/3/31.
//  Copyright © 2017年 DZM. All rights reserved.
//

import UIKit
class InfoCell:UITableViewCell {
    
}
class BookDetailViewController: UIViewController{

    @IBOutlet weak var btnPurchase: UIButton!
    @IBOutlet weak var btnJoinBookrack: UIButton!
    @IBOutlet weak var btnFreeRead: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var readVC:HJReadPageController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() -> Void {
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 64
        self.tableView.register(UINib.init(nibName: "MasterDetailCell", bundle: nil), forCellReuseIdentifier: "MasterDetailCell")
        self.tableView.register(UINib.init(nibName: "BookInfoCell", bundle: nil), forCellReuseIdentifier: "BookInfoCell")
        self.tableView.register(UINib.init(nibName: "RelativeBookCell", bundle: nil), forCellReuseIdentifier: "RelativeBookCell")
        
    }
    @IBAction func btnFreeReadClick(_ sender: Any) {
        self.goContentVC()
    }
    func goContentVC() -> Void {
        readVC = HJReadPageController()
        MBProgressHUD.showMessage("本地文件第一次解析慢,以后就会秒进了")
        let fileURL = Bundle.main.url(forResource: "求魔", withExtension: "txt")
            HJReadParser.separateLocalURL(fileURL!) { [weak self] (isOK) in
                MBProgressHUD.hide()
                if self != nil {
                    self?.readVC!.readModel = HJReadModel.readModelWithFileName("求魔")
                    self?.hidesBottomBarWhenPushed = true
                    self?.navigationController?.pushViewController((self?.readVC!)!, animated: true)
//                    self?.hidesBottomBarWhenPushed = false
                }
            }
    }
    
}
extension BookDetailViewController:UITableViewDelegate,UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellid = "BookInfoCell"
        if indexPath.row == 0 {
            cellid = "BookInfoCell"
        }else if indexPath.row == 1 {
            cellid = "MasterDetailCell"
        }else if indexPath.row == 2 {
            cellid = "MasterDetailCell"
        }else if indexPath.row == 3 {
            cellid = "RelativeBookCell"
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        cell?.selectionStyle = .none
        return cell!
    }
}
