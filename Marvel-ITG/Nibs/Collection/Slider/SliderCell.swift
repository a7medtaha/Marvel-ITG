//
//  SliderCell.swift
//  Marvel-ITG
//
//  Created by a7med on 3/7/20.
//  Copyright © 2020 a7med. All rights reserved.
//
import SDWebImage
import UIKit

class SliderCell: UICollectionViewCell {
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setName(_ name: String) {
        nameLbl.text = name
    }
    
    func setTotal(_ num:Int,from count: Int) {
        totalLbl.text = "\(num) / \(count)"
    }
    
    func setPhoto(with Url: String) {
        
        let logo_url = URL(string: Url)
        photo.sd_imageTransition = .fade
        
        photo.sd_imageIndicator = SDWebImageActivityIndicator.gray
        photo.sd_setImage(with: logo_url, placeholderImage: placeHolder_image, options: [.continueInBackground,.progressiveLoad])
    }
}
