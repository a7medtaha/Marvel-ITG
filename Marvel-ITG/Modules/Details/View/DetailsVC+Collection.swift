//
//  DetailsVC+Collection.swift
//  Marvel-ITG
//
//  Created by a7med on 3/5/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import UIKit
extension DetailsVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 2:
            return item?.comics?.items?.count ?? 1
        case 3:
            return item?.series?.items?.count ?? 1
        case 4:
            return item?.stories?.items?.count ?? 1
        case 5:
            return item?.events?.items?.count ?? 1
        default:
            return 0
        }
    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        switch collectionView.tag {
        case 2:
            cell.setData(item?.comics?.items?[indexPath.item].name ?? "")
            
        case 3:
               cell.setData(item?.series?.items?[indexPath.item].name ?? "")
        case 4:
              cell.setData(item?.stories?.items?[indexPath.item].name ?? "")
        case 5:
              cell.setData(item?.events?.items?[indexPath.item].name ?? "")
        default:
            return cell
        }
        
        return cell

        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: collectionView.frame.height)
    }
    
    
    
}
