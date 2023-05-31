//
//  GetNewsResponseModelItem.swift
//  noticeTestApp
//
//  Created by nakamori on 2023/05/30.
//

import Foundation
import ObjectMapper

class GetNewsResponseModelItem: Mappable {
    var id: String?
    var notificationType: Int?
    var notificationBody: String?
    var periodStart: ApiResponseDateModel?
    var image: String?
    var linkUrl: String?
    var bannerType: String?
    var order: String?
    var newFlag: String?
    var targetOs: [String]?
    var targetCarrier: [String]?
    var targetUser: [String]?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        id <- map["_id"]
        notificationType <- map["notification_type"]
        notificationBody <- map["notification_body"]
        periodStart <- map["period_start"]
        image <- map["image"]
        bannerType <- map["banner_type"]
        linkUrl <- map["link_url"]
        order <- map["order"]
        newFlag <- map["new_flag"]
        targetOs <- map["target_os"]
        targetCarrier <- map["target_carrier"]
        targetUser <- map["target_user"]

    }



}
