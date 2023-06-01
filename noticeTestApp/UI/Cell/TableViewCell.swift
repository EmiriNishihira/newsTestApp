//
//  TableViewCell.swift
//  noticeTestApp
//
//  Created by nakamori on 2023/05/30.
//

import UIKit
import WebKit


class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var periodStartLabel: UILabel!
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var bodyLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func onTappedMoreButton(_ sender: Any) {
        let urlString = "https://zutool.jp/app-column/post-27743"

        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

}
