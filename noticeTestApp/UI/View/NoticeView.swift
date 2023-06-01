//
//  NoticeView.swift
//  noticeTestApp
//
//  Created by nakamori on 2023/05/30.
//

import UIKit

class NoticeView: NibView {

    @IBOutlet weak var tableView: UITableView!
    let noticeCell = "NoticeCell"
    var notice: [Notice] = [] {
        didSet {
            setUp()
            tableView.reloadData()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

    private func setUp() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: noticeCell)
    }

    func getImageFromURL(url: URL, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }


}

extension NoticeView: UITableViewDelegate {

}

extension NoticeView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notice.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: noticeCell, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }

        cell.titleImageView.image = UIImage(named: notice[indexPath.row].notificationType.rawValue)
        cell.periodStartLabel.text = String(notice[indexPath.row].periodStart)
        cell.bodyLabel.text = notice[indexPath.row].notificationBody

        let imageUrlString = notice[indexPath.row].imageUrl
        if let url = URL(string: imageUrlString) {
            getImageFromURL(url: url) { image in
                if let image = image {
                    cell.bannerImageView.image = image
                } else {
                    print("画象変換失敗")
                }
            }
        }

        return cell
    }


}
