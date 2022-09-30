//
//  CharacterPresenter.swift
//  MarvelHeroes
//
//  Created by tayfun on 29.09.2022.
//

import UIKit


class CharacterPresenter: NSObject, UICollectionViewDelegate {
    
    weak var controller: CharacterListViewController?
    var pageCounter = 1
    var activityIndicator = ActivityIndicator()
    private let dataSource = CollectionViewDataSource()
    
    var collectionView: UICollectionView = {
       let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.size.width)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 5.0
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    func configureNavigationBar(){
        controller?.navigationController?.navigationBar.barStyle = .black
        let navBar = controller?.navigationController?.navigationBar
        navBar?.shadowImage = UIImage()
        navBar?.isTranslucent = false
        navBar?.barTintColor = .red
        
        let leftTitle = UILabel()
        leftTitle.font = UIFont(name: heroFontName, size: titleFontSize)
        leftTitle.text = "Comic Characters"
        leftTitle.textColor = .white // we can add some custom colours later
        leftTitle.applyShadow(shadowColour: .black)
        controller?.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftTitle)
    }
    
    func displayLayout(){
        guard let controller = controller else {return} // could add an alertview view
        controller.view.addSubview(collectionView)
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        collectionView.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: "Characters")
        collectionView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: controller.view.topAnchor).isActive = true
        collectionView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: controller.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        activityIndicator.displayActivity(view: collectionView)
        activityIndicator.startAanimating()
        fetchData()
    }
    
    //MARK:- Helper
    fileprivate func fetchData(){
        dataSource.fetchData(pageNumber: 0)
        dataSource.updateUIWithData = { [weak self] (error) in
            if let weakSelf = self, error == nil{
                DispatchQueue.main.async {
                    weakSelf.activityIndicator.stopAnimating()
                    weakSelf.collectionView.reloadData()
                    weakSelf.pageCounter += 1
                }
            }
        }
    }
    
    //MARK:- CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let character = dataSource.characters[indexPath.item]
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.animateButtonPress()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            let detailViewController = CharacterDetailViewController()
            detailViewController.character = character
        self?.controller?.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.size.height - 160{
            dataSource.fetchData(pageNumber: pageCounter)
        }
    }
    
    
}
