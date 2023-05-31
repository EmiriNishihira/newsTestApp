//
//  GetNewsRequestModel.swift
//  noticeTestApp
//
//  Created by nakamori on 2023/05/30.
//

import Foundation

class GetNewsRequestModel {
    var userId = ""
    var userToken = ""

    func toParams() -> [String: Any] {
        return [
            "user_id": userId,
            "user_token": userToken
        ]
    }
}
