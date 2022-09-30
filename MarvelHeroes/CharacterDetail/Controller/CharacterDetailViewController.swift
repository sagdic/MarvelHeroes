//
//  CharacterDetailViewController.swift
//  MarvelHeroes
//
//  Created by tayfun on 30.09.2022.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    var presenter = CharacterDetailPresenter()
    var interactor = CharacterDetailInteractor()
    
    var character: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    fileprivate func setup(){
        view.backgroundColor = .white
        presenter.controller = self
        presenter.displayLayout()
        interactor.controller = self
        
        let baseNavigationController = navigationController as? BaseNavigationViewController
        baseNavigationController?.applyStyling(navTitle: "Character Details", shouldAddBackButton: true, viewController: self)
    }
}
