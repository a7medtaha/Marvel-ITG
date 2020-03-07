//
//  SliderView+Collection.swift
//  Marvel-ITG
//
//  Created by a7med on 3/7/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import UIKit
extension SliderView:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCell
        cell.setName(images[indexPath.row].0)
        cell.setPhoto(with: images[indexPath.row].1)
        cell.setTotal(indexPath.row + 1, from: images.count)
        return cell
        
    }
    
   
    
    func setCollectionView()  {
           collectionView.register(UINib(nibName: "SliderCell", bundle: Bundle.main), forCellWithReuseIdentifier: "SliderCell")
        collectionView.delegate = self
        collectionView.dataSource = self
           collectionView.allowsMultipleSelection = false
           
       }
}
