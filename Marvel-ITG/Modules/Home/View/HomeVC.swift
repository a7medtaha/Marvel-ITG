//
//  HomeVC.swift
//  Marvel-ITG
//
//  Created by a7med on 3/5/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private (set) var presenter : HomeVCPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         setNavBarTitle()
        setTableView()
        presenter = HomeVCPresenter(view: self)
        presenter.get_list(offest: 0)
    }
    

    func setNavBarTitle() {
    let nav_title_view = (Bundle.main.loadNibNamed("CustomNavTitle", owner: self, options: nil)![0] as? CustomNavTitle)
        navigationItem.titleView = nav_title_view
    }

}
