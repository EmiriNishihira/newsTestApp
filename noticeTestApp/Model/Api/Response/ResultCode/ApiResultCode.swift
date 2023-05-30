//
//  ApiResultCode.swift
//  noticeTestApp
//
//  Created by nakamori on 2023/05/30.
//

import Foundation

enum ApiResultCode: Int {
    case Success = 1001
    case Unknown = 5000
    static func create(rawValue: Int) -> Self {
        switch rawValue {
        case ApiResultCode.Success.rawValue:
            return .Success
        default:
            return .Unknown
        }
    }
}
