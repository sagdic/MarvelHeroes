//
//  Character.swift
//  MarvelHeroes
//
//  Created by tayfun on 30.09.2022.
//

import Foundation

struct Character: Codable {
    let id : Int?
    let name : String?
    let description : String?
    let modified : String?
    let thumbnail : Thumbnail?
    let resourceURI : String?
    let comics : CharacterComics?
}
