//
//  NewsRepositoryInterface.swift
//  noticeTestApp
//
//  Created by nakamori on 2023/05/31.
//

import Foundation

protocol NewsRepositoryInterface {
    func getNews(onSuccess: @escaping([Notice]) -> Void, onError: @escaping() -> Void)
}
