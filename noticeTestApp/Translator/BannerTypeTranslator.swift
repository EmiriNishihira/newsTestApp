//
//  BannerTypeTranslator.swift
//  noticeTestApp
//
//  Created by nakamori on 2023/05/31.
//

import Foundation

class BannerTypeTranslator {
    static func translate(input: String?) -> NoticeBannerType {
        switch input {
        case "premium":
            return .premium
        case "moview":
            return .movie
        case "link":
            return .link
        case "column":
            return .column
        default:
            return .unknown
        }
    }
}
