//
//  NewsTranslator.swift
//  noticeTestApp
//
//  Created by nakamori on 2023/05/31.
//

import Foundation

class NewsTranslator {
    static func translate(input: GetNewsResponseModelItem) -> Notice {

        let notificationType = NotificationTypeTranslator.translate(input: input.notificationType ?? 0)
        let notificationBody = input.notificationBody ?? ""
        let imageUrl = input.image ?? ""
        let linkUrl = input.linkUrl ?? ""
        let bannerType = BannerTypeTranslator.translate(input: input.bannerType)
        let periodStart = input.periodStart?.sec ?? 0
        return Notice(notificationType: notificationType, notificationBody: notificationBody, imageUrl: imageUrl, linkUrl: linkUrl, bannerType: bannerType, periodStart: periodStart)
    }
}
