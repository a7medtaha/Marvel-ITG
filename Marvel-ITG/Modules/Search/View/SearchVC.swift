//
//  SearchVC.swift
//  Marvel-ITG
//
//  Created by a7med on 3/6/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    var items : [Results]?
    var itemsCached : [ResultsCached]?
    var filtereditems: [Results] = []
    var filteritemsCached: [ResultsCached] = []
    let searchController = UISearchController(searchResultsController: nil)
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("items",items ?? [])
        setTableView()
         setSearch()
    }
    
    func setSearch()  {
            searchController.searchResultsUpdater = self
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.searchBar.placeholder = "Search By Name"
            navigationItem.searchController = searchController
            definesPresentationContext = true
    }
    func filterContentForSearchText(_ searchText: String) {
        if items != nil {
            filtereditems = items!.filter { (item) -> Bool in
                
                return item.name!.lowercased().contains(searchText.lowercased())
            }
            print("asd",filtereditems)
        }else{
          filteritemsCached = itemsCached!.filter { (item) -> Bool in
                return item.name.lowercased().contains(searchText.lowercased())
            }

        }
      
      
      tableView.reloadData()
    }
}



extension SearchVC: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    filterContentForSearchText(searchBar.text!)
    
    }
}
