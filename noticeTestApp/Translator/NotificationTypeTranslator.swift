//
//  NotificationTypeTranslator.swift
//  noticeTestApp
//
//  Created by nakamori on 2023/05/31.
//

import Foundation

class NotificationTypeTranslator {
    static func translate(input: Int) -> NotificationType {
        switch input {
        case 0:
            return .news
        case 1:
            return .important
        case 2:
            return .update
        case 3:
            return .survey
        default:
            return .none
        }
    }
}
