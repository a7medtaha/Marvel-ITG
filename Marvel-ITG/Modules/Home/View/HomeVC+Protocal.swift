//
//  HomeVC+Protocal.swift
//  Marvel-ITG
//
//  Created by a7med on 3/5/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import Foundation
extension HomeVC: HomeVCView{
    func didSelectItem<T>(with data: T) {
        let vc = DetailsVC()
        vc.item = data as? Results
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    
  
    
    func onConnection() {
        tableView.setConnectionView()
        
    }
    
    func onEmpty() {
        tableView.setEmptyView()
    }
    
    func onFailure<T>(_ msg: T) {
       print("")
    }
    
    func onSuccess<T>(_ msg: T) {
        tableView.reloadData()
    }
  
    
    func loader_start() {
        print("")
//        startAnimating()
    }
    
    func loader_stop() {
         print("")
//        stopAnimating()
    }
    
    
    
    
}
