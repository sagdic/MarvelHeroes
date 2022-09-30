//
//  CharacterDetailInteractor.swift
//  MarvelHeroes
//
//  Created by tayfun on 30.09.2022.
//

import UIKit

class CharacterDetailInteractor{
    weak var controller: CharacterDetailViewController?
    
    @objc func popViewController(){
        controller?.navigationController?.popViewController(animated: true)
    }
}

