//
//  MainAppApiAuthentificationDataStore.swift
//  noticeTestApp
//
//  Created by nakamori on 2023/05/31.
//

import Foundation

class MainAppApiAuthentificationDataStore: ApiAuthentificationDataStore {
    func getApiAuthentification() -> ApiAuthentification? {
        return ApiAuthentification(userId: "1", userToken: "a")
    }
}
