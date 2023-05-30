//
//  GetNewsResponseModel.swift
//  noticeTestApp
//
//  Created by nakamori on 2023/05/30.
//

import Foundation
import ObjectMapper

class GetNewsResponseModel: Mappable {
    var resultCode = 0
    var resultMessage = ""
    var records: [GetNewsResponseModelItem]?

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        resultCode <- map["result_code"]
        resultMessage <- map["result_message"]
        records <- map["records"]
    }

}
