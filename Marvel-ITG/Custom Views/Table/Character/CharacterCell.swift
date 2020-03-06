//
//  CharacterCell.swift
//  Marvel-ITG
//
//  Created by a7med on 3/5/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import UIKit
import SDWebImage



typealias CharacterCellView = (DataView&PhotoView)

class CharacterCell: UITableViewCell,CharacterCellView {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var photo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setData<T>(_ dt: T) {
        nameLbl.text = (dt as? String) ?? ""
    }
    
    func setPhoto(with Url: String) {
         
        let logo_url = URL(string: Url)
        photo.sd_imageTransition = .fade
        photo.sd_imageIndicator = SDWebImageActivityIndicator.gray
        photo.sd_setImage(with: logo_url, placeholderImage: placeHolder_image, options: [.continueInBackground,.progressiveLoad])
    }
}
