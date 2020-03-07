//
//  UIButtonX.swift
//  Marvel-ITG
//
//  Created by a7med on 3/7/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import UIKit

@IBDesignable
class UIButtonX: UIButton {
    
    enum FromDirection:Int {
        case Top = 0
        case Right = 1
        case Bottom = 2
        case Left = 3
    }
    
    var shadowView: UIView!
    var direction: FromDirection = .Left
    var alphaBefore: CGFloat = 1
    
    @IBInspectable var animate: Bool = false
    @IBInspectable var animateDelay: Double = 0.2
    @IBInspectable var animateFrom: Int {
        get {
            return direction.rawValue
        }
        set (directionIndex) {
            direction = FromDirection(rawValue: directionIndex) ?? .Left
        }
    }
    @IBInspectable public var bottom2Sides: CGFloat = 0 {
        didSet {
            layer.cornerRadius = bottom2Sides
            layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        }
    }
    @IBInspectable var popIn: Bool = false
    @IBInspectable var popInDelay: Double = 0.4
    
    override func draw(_ rect: CGRect) {
        self.clipsToBounds = true
        
        if animate {
            let originalFrame = frame
            
            if direction == .Bottom {
                frame = CGRect(x: frame.origin.x, y: frame.origin.y + 200, width: frame.width, height: frame.height)
            }
            
            UIView.animate(withDuration: 0.3, delay: animateDelay, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
                self.frame = originalFrame
            }, completion: nil)
        }
        
        if popIn {
            transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            UIView.animate(withDuration: 0.8, delay: popInDelay, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
                self.transform = CGAffineTransform.identity
            }, completion: nil)
        }
    }
      
    


    @IBInspectable
      /// Should the corner be as circle
      public var circleCorner: Bool {
          get {
              return min(bounds.size.height, bounds.size.width) / 2 == cornerRadius
          }
          set {
              cornerRadius = newValue ? min(bounds.size.height, bounds.size.width) / 2 : cornerRadius
          }
      }
      
      @IBInspectable
      /// Corner radius of view; also inspectable from Storyboard.
      public var cornerRadius: CGFloat {
          get {
              return layer.cornerRadius
          }
          set {
              layer.cornerRadius = circleCorner ? min(bounds.size.height, bounds.size.width) / 2 : newValue
                  //abs(CGFloat(Int(newValue * 100)) / 100)
          }
      }
    
    


}
