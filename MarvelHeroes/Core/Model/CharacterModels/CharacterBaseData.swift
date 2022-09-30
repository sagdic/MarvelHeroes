//
//  CharacterBaseData.swift
//  MarvelHeroes
//
//  Created by tayfun on 30.09.2022.
//

import Foundation

struct CharacterBaseData: Codable {
    let responseCode: Int?
    let apiDataSource: CharacterDataSource?
    
    enum CodingKeys: String, CodingKey{
        case responseCode = "code"
        case apiDataSource = "data"
    }
}
