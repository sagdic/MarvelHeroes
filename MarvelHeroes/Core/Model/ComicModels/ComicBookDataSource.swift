//
//  ComicBookDataSource.swift
//  MarvelHeroes
//
//  Created by tayfun on 30.09.2022.
//

import Foundation

struct ComicBookDataSource : Codable {
    let comics: [Comic]?
    
    enum CodingKeys: String, CodingKey{
        case comics = "results"
    }
}
