//
//  EmptyView.swift
//  Moon Shop
//
//  Created by a7med on 1/25/20.
//  Copyright © 2020 2grand. All rights reserved.
//

import UIKit


class EmptyView: UIView {
  
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var photo: UIImageView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func configureView(_ title: String, _ image: UIImage) {
        titleLbl.text = title
        photo.image =  image
      }

}
