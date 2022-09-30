//
//  ViewController.swift
//  MarvelHeroes
//
//  Created by tayfun on 28.09.2022.
//

import UIKit

class CharacterListViewController: UIViewController {
    
    let presenter = CharacterPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
        
    }
    
    fileprivate func setup(){
        view.backgroundColor = .white
        presenter.controller = self
        presenter.displayLayout()
    }
    
    fileprivate func setupNavBar(){
        let navigationController = self.navigationController as? BaseNavigationViewController
        navigationController?.applyStyling(navTitle: "Comic Characters", shouldAddBackButton: false, viewController: self)
    }
}


