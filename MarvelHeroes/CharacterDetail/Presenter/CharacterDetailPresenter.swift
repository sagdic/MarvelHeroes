//
//  CharacterDetailPresenter.swift
//  MarvelHeroes
//
//  Created by tayfun on 30.09.2022.
//

import UIKit

class CharacterDetailPresenter{
    
    weak var controller: CharacterDetailViewController?
    var characterDataSource = CharacterDetailTableViewDataSource()
    var characterTableViewDelegate = CharacterDetailTableViewDelegate()
    
    var characterDetailTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .white // not supporting dark mode currently
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView(frame: .zero)
        return tableView
    }()
    
    func configureNavigationBar(){
        
        let label = UILabel()
        label.text = "Character Information"
        label.textColor = .white
        label.font = UIFont(name: heroFontName, size: titleFontSize)
        label.applyShadow(shadowColour: .black)
        
        let backButton = UIButton(type: .custom)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.tintColor = .white
        let image = UIImageView(image: UIImage(named: "BackButton")?.withRenderingMode(.alwaysTemplate))
        image.tintColor = .white
        backButton.setImage(image.image, for: .normal)
        backButton.addTarget(controller?.interactor, action: #selector(controller?.interactor.popViewController), for: .touchUpInside)
        backButton.applyShadow(shadowColour: .black)
        
        let item1 = UIBarButtonItem(customView: backButton)
        
        let fixedSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.fixedSpace, target: nil, action: nil)
        fixedSpace.width = 10.0
        let item2 = UIBarButtonItem(customView: label)
        controller?.navigationItem.leftBarButtonItems = [item1, fixedSpace, item2]
    }
    
    func displayLayout(){
        
        guard let controller = controller else {return}
        controller.view.addSubview(characterDetailTableView)
        
        //register cells
        registerTableViewCells()
        
        characterDetailTableView.dataSource = characterDataSource
        characterDetailTableView.delegate = characterTableViewDelegate
        characterDataSource.fetchDataFromSelectedArray(character: controller.character)
        characterDetailTableView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor).isActive = true
        characterDetailTableView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor).isActive = true
        characterDetailTableView.topAnchor.constraint(equalTo: controller.view.topAnchor).isActive = true
        characterDetailTableView.bottomAnchor.constraint(equalTo: controller.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    fileprivate func registerTableViewCells(){
        characterDetailTableView.register(CharacterHeaderTableViewCell.self, forCellReuseIdentifier: "CharacterHeader")
        characterDetailTableView.register(CharacterDescriptionTableViewCell.self, forCellReuseIdentifier: "CharacterDescriptionCell")
        characterDetailTableView.register(CharacterComicTableViewCell.self, forCellReuseIdentifier: "CharacterComics")
    }
}


