//
//  NewsApiDataStore.swift
//  noticeTestApp
//
//  Created by nakamori on 2023/05/30.
//

import Alamofire
import AlamofireObjectMapper

final class NewsApiDataStore {
    func getNews(requestModel: GetNewsRequestModel, onSuccess: @escaping([GetNewsResponseModelItem]) -> Void, onError: @escaping() -> Void) {
        let sessionManager = Alamofire.SessionManager.default
        sessionManager.request(ApiEndPoint.GetNotice.url(), method: .get, parameters: requestModel.toParams(), encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<GetNewsResponseModel>) in
            switch response.result {
            case .success(let data):
                let apiResultCode = ApiResultCode.create(rawValue: data.resultCode)
                if apiResultCode != .Success {
                    print("Failure newsList: invalid result code \(apiResultCode.rawValue)")
                    onError()
                    return
                }
                guard let newsList = data.records else {
                    onError()
                    print("Failure newsList empty records")
                    return
                }
                print("Success newsList")
                onSuccess(newsList)
            case .failure(let error):
                print("Failure newsList")
                print(error)
                onError()
            }
        }
    }
}
