//
//  SliderView.swift
//  Marvel-ITG
//
//  Created by a7med on 3/7/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import UIKit

class SliderView: UIViewController {
    fileprivate var currentPage: Int = 0
    fileprivate var pageSize: CGSize {
           let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
           var pageSize = layout.itemSize
           if layout.scrollDirection == .horizontal {
               pageSize.width -= layout.minimumLineSpacing
           } else {
               pageSize.height -= layout.minimumLineSpacing
           }
           return pageSize
       }
    @IBOutlet weak var bgImage: UIImageView!
    var images : [(String,String)] = []
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bgImage.blurEffect()
        self.setupLayout()

        setCollectionView()
    }
    
    @IBAction func closedBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    fileprivate func setupLayout() {
          let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
          layout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 5)
        layout.itemSize = collectionView.frame.size
      }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
        print("current ==>",currentPage)
    }

}
