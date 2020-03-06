//
//  HomeVC+Protocal.swift
//  Marvel-ITG
//
//  Created by a7med on 3/5/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import Foundation
extension HomeVC: HomeVCView{
    func reloadWithCach() {
        tableView.reloadData()
    }
    
    func didSelectItem<T>(with data: T) {
        let vc = DetailsVC()
        if ((data as? Results) != nil){
            vc.item = data as? Results
        }
        if ((data as? ResultsCached) != nil){
            vc.itemCached = data as? ResultsCached
        }
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
        pageCounter += 1
        tableView.reloadData()
    }
    
    
    func loader_start() {
        activityIndicator.displayActivity(view: tableView)
        activityIndicator.startAanimating()
    }
    
    func loader_stop() {
        activityIndicator.stopAnimating()
        
    }
    
    
    
    
}
