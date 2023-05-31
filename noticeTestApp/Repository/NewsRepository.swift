//
//  NewsRepository.swift
//  noticeTestApp
//
//  Created by nakamori on 2023/05/31.
//

import Foundation

class NewsRepository: NewsRepositoryInterface {

    private let apiAuthentificationDataStore: ApiAuthentificationDataStore
    private let newsApiDataStore = NewsApiDataStore()

    init(apiAuthentificationDataStore: ApiAuthentificationDataStore) {
        self.apiAuthentificationDataStore = apiAuthentificationDataStore
    }
    func getNews(onSuccess: @escaping([Notice]) -> Void, onError: @escaping() -> Void) {
        guard let apiAuth = apiAuthentificationDataStore.getApiAuthentification() else {
            print("api authentification not found")
            onError()
            return
        }
        let requestModel = GetNewsRequestModel()
        requestModel.userId = apiAuth.userId
        requestModel.userToken = apiAuth.userToken

        newsApiDataStore.getNews(requestModel: requestModel) { newsList in
            let newsList = newsList.compactMap { _newsList in
                NewsTranslator.translate(input: _newsList)
            }
            onSuccess(newsList)
        } onError: {
            onError()
        }

    }

    
}
