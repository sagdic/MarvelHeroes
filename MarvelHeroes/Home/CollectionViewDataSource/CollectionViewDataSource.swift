//
//  CollectionViewDataSource.swift
//  MarvelHeroes
//
//  Created by tayfun on 29.09.2022.
//

import UIKit


class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var updateUIWithData: ((Error?) -> Void)?
    var characters = [Character]()
    
    func fetchData(pageNumber: Int){
        let request = RequestHandler().getCharacters(pageNumber: pageNumber)
        JSONDecoder().decoderWithRequest(CharacterBaseData.self, fromURLRequest: request) { [weak self] (result, error) in
            if let weakSelf = self{
                let charactersResult = result?.apiDataSource?.characters
                if let characters = charactersResult{
                    weakSelf.characters.append(contentsOf: characters)
                }else{
                    // show alert
                }
                
                weakSelf.updateUIWithData?(error)
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let character = characters[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Characters", for: indexPath) as! CharacterCollectionViewCell
        cell.setData(character: character)
        return cell
    }
}
