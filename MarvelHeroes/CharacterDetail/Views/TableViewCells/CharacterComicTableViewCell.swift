//
//  CharacterComicTableViewCell.swift
//  MarvelHeroes
//
//  Created by tayfun on 30.09.2022.
//

import UIKit

final class CharacterComicTableViewCell: UITableViewCell {
    
    var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 130, height: 290)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 10.0
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        //        collection.contentInsetAdjustmentBehavior = .never
        return collection
    }()
    fileprivate var activity = ActivityIndicator()
    var dataSource = CharacterCollectionViewDataSource()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        displayLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    fileprivate func displayLayout(){
        contentView.addSubview(collectionView)
        // register the cell
        collectionView.register(ComicBookCollectionViewCell.self, forCellWithReuseIdentifier: "ComicBooksCell")
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4).isActive = true
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.dataSource = dataSource
        dataSource.updateCollectionView = { [weak self] in
            if let weakSelf = self{
                // pass back to the main thread
                DispatchQueue.main.async {
                    weakSelf.activity.stopAnimating()
                    weakSelf.collectionView.reloadData()
                }
            }
        }
        collectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 310).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        activity.displayActivity(view: contentView)
        activity.startAanimating()
  
    }
    
}

