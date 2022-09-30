//
//  ActivityIndicator.swift
//  MarvelHeroes
//
//  Created by tayfun on 30.09.2022.
//

import UIKit

final class ActivityIndicator{
    
    var activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .large)
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.color = .black
        return activity
    }()
    
    func displayActivity(view: UIView){
        view.addSubview(activityIndicator)
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func startAanimating(){
        activityIndicator.startAnimating()
    }
    
    func stopAnimating(){
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
}
