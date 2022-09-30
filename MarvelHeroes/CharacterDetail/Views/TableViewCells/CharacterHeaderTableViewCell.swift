//
//  CharacterHeaderTableViewCell.swift
//  MarvelHeroes
//
//  Created by tayfun on 30.09.2022.
//

import UIKit

class CharacterHeaderTableViewCell: UITableViewCell {
    
    var profileHolderView: UIView = {
        let holder = UIView()
        holder.translatesAutoresizingMaskIntoConstraints = false
        holder.layer.cornerRadius = 120/2
        holder.clipsToBounds = true
        holder.applyShadow(shadowColour: .black)
        return holder
    }()
    
    var profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.layer.cornerRadius = 120/2
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.clipsToBounds = true
        return profileImage
    }()
    var nameOfHero: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont(name: heroFontName, size: 40)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        layoutTableViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    fileprivate func layoutTableViewCell(){
        
        contentView.addSubview(nameOfHero)
        contentView.addSubview(profileHolderView)
        profileHolderView.addSubview(profileImage)
        profileHolderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        profileHolderView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        profileHolderView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        profileHolderView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        profileImage.leadingAnchor.constraint(equalTo: profileHolderView.leadingAnchor).isActive = true
        profileImage.topAnchor.constraint(equalTo: profileHolderView.topAnchor).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        var height = nameOfHero.constraints.filter{$0.firstAttribute == .height}.first?.constant ?? 60
        height = height / 2
        nameOfHero.leadingAnchor.constraint(equalTo: profileHolderView.trailingAnchor, constant: 10).isActive = true
        nameOfHero.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        nameOfHero.centerYAnchor.constraint(equalTo: profileHolderView.centerYAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: nameOfHero.bottomAnchor, constant: height + 20).isActive = true 
    }
    
}
