//
//  HistoryRecordViewController.swift
//  DZMeBookRead
//
//  Created by zyz on 17/3/22.
//  Copyright © 2017年 DZM. All rights reserved.
//

import UIKit

class HistoryRecordViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tblRecord: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblRecord.rowHeight = UITableViewAutomaticDimension
        self.tblRecord.estimatedRowHeight = 150
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        cell?.selectionStyle = .none
        return cell!
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
