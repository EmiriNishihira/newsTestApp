//
//  ApiEndPoint.swift
//  noticeTestApp
//
//  Created by nakamori on 2023/05/30.
//

import Foundation

enum ApiEndPoint {
    case GetNotice

    func url() -> String {
        switch self {
        case .GetNotice:
            return "http://localhost:3001/getnotice.json"
        }
    }
}
