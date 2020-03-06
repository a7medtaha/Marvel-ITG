//
//  HomeVC+Table.swift
//  Marvel-ITG
//
//  Created by a7med on 3/5/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import UIKit
extension HomeVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.get_list_count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        presenter.configureCell(cell: cell, at: indexPath.row)
        
        return cell
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.animateButtonPress()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self!.presenter.didselect(at: indexPath.row)

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
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
           let offsetY = scrollView.contentOffset.y
           let contentHeight = scrollView.contentSize.height
           
           if offsetY > contentHeight - scrollView.frame.size.height - 160{
            
            presenter.get_list(offest: pageCounter)
           }
       }
}
