//
//  HomeVC+Protocal.swift
//  Marvel-ITG
//
//  Created by a7med on 3/5/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import UIKit
extension HomeVC: HomeVCView{
    func presentSearchVC<T>(with data: T) {
        let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
        if ((data as? [Results]) != nil){
            print("data",data)
            vc.items = data as? [Results]
        }
        if ((data as? [ResultsCached]) != nil){
            vc.itemsCached = data as? [ResultsCached]
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
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
        let view = (Bundle.main.loadNibNamed("LoaderTBFooter", owner: self, options: nil)![0] as? LoaderTBFooter)
        view?.loader_start()
        tableView.tableFooterView = view
        tableView.reloadData()
    }
    
    
    func loader_start() {
        activityIndicator.displayActivity(view: view)
        activityIndicator.startAanimating()
    }
    
    func loader_stop() {
        activityIndicator.stopAnimating()
        
    }
    
    
    
    
}
