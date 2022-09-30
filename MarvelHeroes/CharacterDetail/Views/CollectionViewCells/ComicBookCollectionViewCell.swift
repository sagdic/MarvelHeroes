//
//  ComicBookCollectionViewCell.swift
//  MarvelHeroes
//
//  Created by tayfun on 30.09.2022.
//

import UIKit


class ComicBookCollectionViewCell: UICollectionViewCell {
    
    var activity = ActivityIndicator()
    
    var comicBookCover: UIImageView = {
        let cover = UIImageView()
        cover.contentMode = .scaleAspectFill
        cover.clipsToBounds = true
        cover.layer.masksToBounds = true
        cover.translatesAutoresizingMaskIntoConstraints = false
        return cover
    }()
    
    var comicTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont(name: heroFontName, size: 17)
        title.textColor = .black
        title.numberOfLines = 0
        title.textAlignment = .center
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        self.clipsToBounds = true
        contentView.applyShadow(shadowColour: .black)
        displayCellContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func displayCellContent(){
        
        contentView.addSubview(comicBookCover)
        comicBookCover.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        comicBookCover.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        comicBookCover.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        comicBookCover.heightAnchor.constraint(lessThanOrEqualToConstant: 160).isActive = true

        
        contentView.addSubview(comicTitle)
        comicTitle.topAnchor.constraint(equalTo: comicBookCover.bottomAnchor, constant: 15).isActive = true
        comicTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        comicTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        contentView.bottomAnchor.constraint(equalTo: comicTitle.bottomAnchor).isActive = true
        
        activity.displayActivity(view: contentView)
        
    }
    
    func setData(comic: Comic?){
        comicTitle.text = comic?.title
        activity.startAanimating()
        guard let path = comic?.cover?.path, let ext = comic?.cover?.fileExtension else {
            comicBookCover.image = UIImage(named: "Placeholder")
            activity.stopAnimating()
            return
        }
        let url = path + "." + ext
        comicBookCover.sd_setImage(with: URL(string: url)!, placeholderImage: nil, options: .continueInBackground) { (image, error, cache, url) in
            self.activity.stopAnimating()
        }
    }
    
}
