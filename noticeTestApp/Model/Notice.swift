//
//  NoticeBanner.swift
//  noticeTestApp
//
//  Created by nakamori on 2023/05/30.
//

import Foundation

struct Notice {
    var notificationType: NotificationType
    var notificationBody = ""
    var imageUrl = ""
    var linkUrl = ""
    var bannerType: NoticeBannerType
    var periodStart: Int
    
}
