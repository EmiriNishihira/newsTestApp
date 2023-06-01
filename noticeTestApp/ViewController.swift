//
//  ViewController.swift
//  noticeTestApp
//
//  Created by nakamori on 2023/05/29.
//

import UIKit

class ViewController: UIViewController {

    private let newsRepository = NewsRepository(apiAuthentificationDataStore: MainAppApiAuthentificationDataStore())
    @IBOutlet weak var noticeBackgroundView: NoticeBackgroundView!

    var notice: [Notice] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNotice()
    }

    func fetchNotice() {
        newsRepository.getNews { notice in
            self.noticeBackgroundView.noticeView.notice = notice
            print("のティス", self.notice)
        } onError: {
            print("データ取得できませんでした")
        }

    }


}

