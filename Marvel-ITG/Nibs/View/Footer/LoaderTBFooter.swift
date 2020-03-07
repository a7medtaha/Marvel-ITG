//
//  LoaderTBFooter.swift
//  Marvel-ITG
//
//  Created by a7med on 3/7/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import UIKit
 
class LoaderTBFooter: UIView {
    lazy private  (set) var activityIndicator = ActivityIndicator()
    func loader_start() {
           activityIndicator.displayActivity(view: self)
           activityIndicator.startAanimating()
       }
       
    

}
