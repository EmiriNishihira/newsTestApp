//
//  NoticeView.swift
//  noticeTestApp
//
//  Created by nakamori on 2023/05/30.
//

import UIKit

class NoticeView: NibView {

    @IBOutlet weak var tableView: UITableView!
    let titleList = ["重要", "ニュース", "アップデート", "アンケート"]
    let imageList = ["a", "b", "c", "d"]
    let bodyList = ["重要です", "ニュースです", "アップデートです", "アンケートです"]
    let noticeCell = "NoticeCell"
    private let newsRepository = NewsRepository(apiAuthentificationDataStore: MainAppApiAuthentificationDataStore())
    private var notice: [Notice] = []
    var notificationBodyList: [String]?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }

    func setUp() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: noticeCell)
        fetchNotice()
    }

    func fetchNotice() {
        newsRepository.getNews { notice in
            self.notice = notice
            let notificationBodyList = notice.map { $0.notificationBody }
            self.notificationBodyList = notificationBodyList
            print("NotificationBodyListの中身", self.notificationBodyList)
        } onError: {
            print("データ取得できませんでした")
        }

    }
}

extension NoticeView: UITableViewDelegate {

}

extension NoticeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titleList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: noticeCell, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.label.text = titleList[indexPath.row]
        cell.noticeImageView.image = UIImage(named: imageList[indexPath.row])
        cell.textView.text = notificationBodyList?[indexPath.row]
        return cell
    }


}
