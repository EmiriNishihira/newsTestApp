//
//  ApiResponseDateModel.swift
//  noticeTestApp
//
//  Created by nakamori on 2023/05/30.
//

import Foundation
import ObjectMapper

class ApiResponseDateModel: Mappable {
    var sec = 0
    var usec = 0

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        sec <- map["sec"]
        usec <- map["usec"]
    }

}
