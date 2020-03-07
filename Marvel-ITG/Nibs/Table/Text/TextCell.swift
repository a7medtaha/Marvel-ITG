//
//  TextCell.swift
//  Marvel-ITG
//
//  Created by a7med on 3/5/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import UIKit
protocol TextCellView:DataView{
    func setExpandBtn(_ hiden: Bool)
   
}
class TextCell: UITableViewCell ,TextCellView{
  
   
    
    @IBOutlet weak var expandBtn: UIButton!
    @IBOutlet weak var textLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setExpandBtn(_ hiden: Bool) {
        expandBtn.isHidden = hiden
      }
      
    func setData<T>(_ dt: T) {
        textLbl.text = dt as? String
       }
}
