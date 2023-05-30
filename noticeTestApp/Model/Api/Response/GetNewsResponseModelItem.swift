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
    var title: String?
    var body: String?
    var periodStart: ApiResponseDateModel?
    var periodEnd: ApiResponseDateModel?
    var image: String?
    var linkUrl: String?
    var bannerType: String?
    var order: String?
    var newFlag: String?
    var targetOs: [String]?
    var insertDate: ApiResponseDateModel?
    var targetCarrier: [String]?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        id <- map["_id"]
        title <- map["title"]
        body <- map["body"]
        periodStart <- map["period_start"]
        periodEnd <- map["period_end"]
        image <- map["image"]
        bannerType <- map["banner_type"]
        linkUrl <- map["link_url"]
        order <- map["order"]
        newFlag <- map["new_flag"]
        targetOs <- map["target_os"]
        insertDate <- map["insert_date"]
        targetCarrier <- map["target_carrier"]

    }



}
