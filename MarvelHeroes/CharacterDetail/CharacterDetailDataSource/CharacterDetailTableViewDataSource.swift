//
//  CharacterDetailTableViewDataSource.swift
//  MarvelHeroes
//
//  Created by tayfun on 30.09.2022.
//

import UIKit
import SDWebImage

class CharacterDetailTableViewDataSource: NSObject, UITableViewDataSource{
    
    var updateUI:(()-> Void)?
    var character: Character?
    
    func fetchDataFromSelectedArray(character: Character?){
        self.character = character
        updateUI?()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterHeader", for: indexPath) as! CharacterHeaderTableViewCell
            let imagePath = "\(character?.thumbnail?.path ?? "").\(character?.thumbnail?.fileExtension ?? "")"
            cell.profileImage.sd_setImage(with: URL(string: imagePath), completed: nil)
            cell.nameOfHero.text = character?.name
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterDescriptionCell", for: indexPath) as! CharacterDescriptionTableViewCell
            if character?.description == ""{
                cell.descriptionLabel.text = "No character description."
            }else{
                cell.descriptionLabel.text = character?.description
            }
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterComics", for: indexPath) as! CharacterComicTableViewCell
            cell.dataSource.fetchComicData(id: character?.id)
            return cell
        }
    }
}
