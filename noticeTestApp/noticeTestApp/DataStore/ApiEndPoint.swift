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
            return "https://api/v2/getnotice.json"
        }
    }
}
