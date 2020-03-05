//
//  TableViewEx.swift
//  Marvel-ITG
//
//  Created by a7med on 3/5/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import UIKit
extension UITableView {
    
    func setEmptyView(title: String, messageImage: UIImage) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        let messageImageView = UIImageView()
        let titleLabel = UILabel()
        messageImageView.backgroundColor = .clear
        messageImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageImageView)
        
        messageImageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageImageView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: -20).isActive = true
        messageImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        messageImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: messageImageView.bottomAnchor, constant: 20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        
        messageImageView.image = messageImage
        titleLabel.text = title
                
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    func setEmptyView()  {
             let view = (Bundle.main.loadNibNamed("EmptyView", owner: self, options: nil)![0] as? EmptyView)
           view?.configureView("Empty Data", emptyData)
           self.backgroundView = view
    }
    func setConnectionView() {
        let view = (Bundle.main.loadNibNamed("EmptyView", owner: self, options: nil)![0] as? EmptyView)
               view?.configureView(" Connection Error ", connectionError)
               self.backgroundView = view
    }
    
    func backgroundViewRestore() {
        self.backgroundView = nil
    }
    
}

extension UICollectionView{
    func setEmptyView()  {
               let view = (Bundle.main.loadNibNamed("EmptyView", owner: self, options: nil)![0] as? EmptyView)
             view?.configureView("Empty Data", emptyData)
             self.backgroundView = view
      }
      func setConnectionView() {
          let view = (Bundle.main.loadNibNamed("EmptyView", owner: self, options: nil)![0] as? EmptyView)
                 view?.configureView(" Connection Error ", connectionError)
                 self.backgroundView = view
      }
      
      func backgroundViewRestore() {
          self.backgroundView = nil
      }
    
}
