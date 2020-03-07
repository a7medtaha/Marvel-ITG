//
//  TBCollectionCell.swift
//  Marvel-ITG
//
//  Created by a7med on 3/5/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import UIKit
protocol TBCollectionCellView:class {
    func setCollectionView(at section: Int)
}
class TBCollectionCell: UITableViewCell,TBCollectionCellView {
    weak var delegate : (UICollectionViewDelegate&UICollectionViewDataSource&UICollectionViewDelegateFlowLayout)?
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCollectionView(at section: Int)  {
        collectionView.tag = section
         collectionView.register(UINib(nibName: "ItemCell", bundle: Bundle.main), forCellWithReuseIdentifier: "ItemCell")
         collectionView.dataSource = delegate
         collectionView.delegate = delegate
         collectionView.allowsMultipleSelection = false
        collectionView.reloadData()
         
     }
}
