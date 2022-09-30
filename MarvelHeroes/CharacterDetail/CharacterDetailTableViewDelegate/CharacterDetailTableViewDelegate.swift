//
//  CharacterDetailTableViewDelegate.swift
//  MarvelHeroes
//
//  Created by tayfun on 30.09.2022.
//

import UIKit

class CharacterDetailTableViewDelegate: NSObject, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1{
            return setupSectionHeader(title: "Character Bio", tableView: tableView)
        }else if section == 2{
            return setupSectionHeader(title: "Comics", tableView: tableView)
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 || section == 2{
            return 60
        }
        return 0
    }
    
    //MARK: - Helper
    
    func setupSectionHeader(title: String, tableView: UITableView) -> UIView{
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 60))
        headerView.backgroundColor = .red
        
        let titleForHeaderView = UILabel()
        headerView.addSubview(titleForHeaderView)
        titleForHeaderView.font = UIFont(name: heroFontName, size: 30)
        titleForHeaderView.text = title
        titleForHeaderView.textColor = .white
        titleForHeaderView.translatesAutoresizingMaskIntoConstraints = false
        titleForHeaderView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10).isActive = true
        titleForHeaderView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20).isActive = true
        titleForHeaderView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        
        return headerView
    }
}
