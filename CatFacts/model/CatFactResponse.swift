//
//  CatFactResponse.swift
//  CatFacts
//
//  Created by Tekla Matcharashvili on 20.11.23.
//

import Foundation

struct CatFactResponse: Codable {
    let data: [CatFact]
    let links: [Link]
}
