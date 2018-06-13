//
//  ListViewController.swift
//  Example
//
//  Created by Daniels on 2018/3/16.
//  Copyright © 2018年 Daniels. All rights reserved.
//

import UIKit
import Tiercel

class ListViewController: UITableViewController {

    static let downloadManager = TRManager("ListViewController", isStoreInfo: true)

    lazy var URLStrings: [String] = {
        return (1...9).map({ _ in "https://tuwanpicshare.oss-cn-qingdao.aliyuncs.com/picshare/201806091688_9524.zip" })
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11, *) {
        } else {
            tableView.contentInset.top = 64
            tableView.scrollIndicatorInsets.top = 64
        }

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return URLStrings.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListViewCell
        cell.URLStringLabel.text = "小黄人\(indexPath.row + 1).mp4"
        let URLStirng = URLStrings[indexPath.row]
        cell.downloadClosure = { cell in
            ListViewController.downloadManager.isStartDownloadImmediately = true
            ListViewController.downloadManager.download(URLStirng, fileName: cell.URLStringLabel.text)
        }

        return cell
    }


}
