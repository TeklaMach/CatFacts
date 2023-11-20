//
//  CatFactAPIManager.swift
//  CatFacts
//
//  Created by Tekla Matcharashvili on 19.11.23.
//

import Foundation
import Alamofire
import Combine

class CatFactAPIManager {
    private let baseUrl = "https://catfact.ninja"
    
    func getCatFacts() -> AnyPublisher<CatFactResponse, Error> {
        let url = "\(baseUrl)/facts?page=1" 
        return AF.request(url)
            .publishDecodable(type: CatFactResponse.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
