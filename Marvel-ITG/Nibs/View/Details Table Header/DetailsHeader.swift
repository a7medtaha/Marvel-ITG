//
//  DetailsHeader.swift
//  Marvel-ITG
//
//  Created by a7med on 3/5/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import UIKit
import  SDWebImage
protocol BackDelegate:class {
    func backBtnPressed()
}
class DetailsHeader: UIView {
    weak  var delegate: BackDelegate?
    @IBOutlet weak var photo: UIImageView!
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        if delegate != nil {
            delegate?.backBtnPressed()
        }
    }
    func setPhoto(with Url: String) {
        
        
        let logo_url = URL(string: Url)
        photo.sd_imageTransition = .fade
        
        photo.sd_imageIndicator = SDWebImageActivityIndicator.gray
        photo.sd_setImage(with: logo_url, placeholderImage: placeHolder_image, options: [.continueInBackground,.progressiveLoad])
        
    }
    
}
