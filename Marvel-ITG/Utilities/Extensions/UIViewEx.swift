//
//  UIViewEx.swift
//  Marvel-ITG
//
//  Created by a7med on 3/6/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import UIKit

extension UIView{
    func animateButtonPress(){
           UIView.animate(withDuration: 0.2,
              animations: {
               self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
           },
              completion: { _ in
               UIView.animate(withDuration: 0.2) {
                   self.transform = CGAffineTransform.identity
               }
           })
    }
    
    func applyShadow(shadowColour: UIColor){
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 0.63
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize(width: 3, height: 2)
        self.layer.shadowColor = shadowColour.cgColor
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    func blurEffect()  {
           let blur_effect = UIBlurEffect(style: .dark)
           let blur_view = UIVisualEffectView(effect: blur_effect)
           blur_view.frame = self.bounds
           self.addSubview(blur_view)
       }
}
