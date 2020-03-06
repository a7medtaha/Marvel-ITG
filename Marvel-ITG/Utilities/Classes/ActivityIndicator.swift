//
//  ActivityIndicator.swift
//  Marvel-ITG
//
//  Created by a7med on 3/6/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import UIKit
final class ActivityIndicator{
    
    var activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        if #available(iOS 13.0, *) {
            activity.style = .large
        } else {
            // Fallback on earlier versions
            activity.style = .gray
        }
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
