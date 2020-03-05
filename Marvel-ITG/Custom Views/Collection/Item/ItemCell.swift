//
//  ItemCell.swift
//  Marvel-ITG
//
//  Created by a7med on 3/5/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import UIKit
import SDWebImage
typealias ItemCellView = (DataView&PhotoView)
class ItemCell: UICollectionViewCell,ItemCellView {
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var photo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setData<T>(_ dt: T) {
           titleLbl.text = (dt as? String) ?? ""
       }
       
       func setPhoto(with Url: String) {
           let logo_url = URL(string: Url)
           photo.sd_imageIndicator = SDWebImageActivityIndicator.gray
        photo.sd_setImage(with: logo_url, placeholderImage: placeHolder_image, options: .continueInBackground)
           
       }
}
