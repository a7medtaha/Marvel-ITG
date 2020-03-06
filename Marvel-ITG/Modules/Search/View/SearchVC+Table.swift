//
//  SearchVC+Table.swift
//  Marvel-ITG
//
//  Created by a7med on 3/6/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import UIKit
extension SearchVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return items != nil ? filtereditems.count : filteritemsCached.count
        }
        
        return  (items != nil ? items?.count : itemsCached?.count) ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        if isFiltering {
            let name = items != nil ? filtereditems[indexPath.row].name ?? "" : filteritemsCached[indexPath.row].name 
            cell.setData(name)
            let path = items != nil ? filtereditems[indexPath.row].thumbnail?.path ?? "" : filteritemsCached[indexPath.row].thumbnail?.path  ?? ""
            let ext = items != nil ? filtereditems[indexPath.row].thumbnail?.exten ?? "" : filteritemsCached[indexPath.row].thumbnail?.exten  ?? ""
            let image_url = (path) + "/\(xlarge)." + (ext)
            cell.setPhoto(with: image_url)        }
        else {
            let name = items != nil ? items?[indexPath.row].name ?? "" : itemsCached?[indexPath.row].name ?? ""
            cell.setData(name)
            let path = items != nil ? items?[indexPath.row].thumbnail?.path ?? "" : itemsCached?[indexPath.row].thumbnail?.path  ?? ""
            let ext = items != nil ? items?[indexPath.row].thumbnail?.exten ?? "" : itemsCached?[indexPath.row].thumbnail?.exten  ?? ""
            let image_url = (path) + "/\(xlarge)." + (ext)
            cell.setPhoto(with: image_url)
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.animateButtonPress()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            let vc = DetailsVC()
            if self!.isFiltering {
                if ((self?.filtereditems[indexPath.row]) != nil){
                    vc.item = self!.filtereditems[indexPath.row] as Results
                }
                if ((self?.filteritemsCached[indexPath.row]) != nil){
                    vc.itemCached = self!.filteritemsCached[indexPath.row]
                }
            }else{
                if ((self?.items?[indexPath.row]) != nil){
                    vc.item = self!.items![indexPath.row] as Results
                }
                if ((self?.itemsCached?[indexPath.row]) != nil){
                    vc.itemCached = self!.itemsCached![indexPath.row]
                }
            }
            
            vc.modalPresentationStyle = .overFullScreen
            self!.present(vc, animated: true, completion: nil)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 3.8
    }
    internal func setTableView()  {
        tableView.register(UINib(nibName: "CharacterCell", bundle: .main), forCellReuseIdentifier: "CharacterCell")
        tableView.allowsMultipleSelection = false
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
    }
    
    
    
}
