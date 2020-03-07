//
//  DetailsVC+Table.swift
//  Marvel-ITG
//
//  Created by a7med on 3/5/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import UIKit
extension DetailsVC:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = item != nil ? item?.urls?.count ?? 0 : itemCached?.urls.count ?? 0
        return   section == 6 ?  count  : 1
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .clear
        
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.backgroundColor = .clear
            header.textLabel?.textColor = .red
            header.textLabel?.font = UIFont.systemFont(ofSize: 16)
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "NAME"
        case 1:
            return "DESCRIPTION"
        case 2:
            return "COMICS"
        case 3:
            return "SERIES"
        case 4:
            return "STORIES"
        case 5:
            return "EVENTS"
        case 6:
            return "RELATED LINKS"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextCell
            cell.setData( item != nil ? item?.name ?? "No Name " :  itemCached?.name ?? "No Name ")
            cell.setExpandBtn(true)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextCell
            cell.setData(item != nil ? item?.description ?? "No Name " :  itemCached?.desc ?? "No Name ")
            cell.setExpandBtn(true)
            return cell
        case 2,3,4,5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TBCollectionCell", for: indexPath) as! TBCollectionCell
            cell.setCollectionView(at: indexPath.section)
            cell.delegate = self
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextCell
            cell.setData( item != nil ? item?.urls?[indexPath.row].type ?? "" : itemCached?.urls[indexPath.row].type)
            cell.setExpandBtn(false)
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 35
        case 1:
            return UITableView.automaticDimension
        case 2,3,4,5:
            return 200
        case 6:
            return 35
        default:
            return 0
        }
    }
    
    internal func setTableView()  {
        let view = (Bundle.main.loadNibNamed("DetailsHeader", owner: self, options: nil)![0] as? DetailsHeader)
        let image_url = (item?.thumbnail?.path ?? "") + "." + (item?.thumbnail?.exten ?? "")
        view?.setPhoto(with: image_url)
        view?.delegate = self
        tableView.tableHeaderView = view
        tableView.tableHeaderView = view
        
        tableView.register(UINib(nibName: "TBCollectionCell", bundle: .main), forCellReuseIdentifier: "TBCollectionCell")
        tableView.register(UINib(nibName: "TextCell", bundle: .main), forCellReuseIdentifier: "TextCell")
        tableView.allowsMultipleSelection = false
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
    }
    
}


extension DetailsVC: BackDelegate{
    func backBtnPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
