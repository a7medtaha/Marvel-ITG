//
//  CharacterCell.swift
//  Marvel-ITG
//
//  Created by a7med on 3/5/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import UIKit
import SDWebImage
protocol CharacterCellView:class {
    func setName(name: String)
    func setPhoto(with Url: String)
}
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
    func setName(name: String) {
         nameLbl.text = name
       }
       
         func setPhoto(with Url: String) {
                   let logo_url = URL(string: Url)
                   photo.sd_imageIndicator = SDWebImageActivityIndicator.gray
                   photo.sd_setImage(with: logo_url, placeholderImage: placeHolder_image)
              
          }
}
