//
//  ComicBaseData.swift
//  MarvelHeroes
//
//  Created by tayfun on 30.09.2022.
//

import Foundation
struct ComicBaseData: Codable {
    
    let responseCode: Int?
    let apiDataSource: ComicBookDataSource?
    
    enum CodingKeys: String, CodingKey{
        case responseCode = "code"
        case apiDataSource = "data"
    }
}

