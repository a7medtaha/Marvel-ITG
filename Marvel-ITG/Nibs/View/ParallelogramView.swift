//
//  ParallelogramView.swift
//  Marvel-ITG
//
//  Created by a7med on 3/5/20.
//  Copyright © 2020 a7med. All rights reserved.
//

import UIKit
@IBDesignable
class ParallelogramView: UIView {

    @IBInspectable var offset:    CGFloat = 60        { didSet { setNeedsDisplay() } }
    @IBInspectable var fillColor: UIColor = .white      { didSet { setNeedsDisplay() } }

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()

        path.move(to: CGPoint(x: bounds.minX + offset, y: bounds.minY))
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.minY))
        path.addLine(to: CGPoint(x: bounds.maxX - offset, y: bounds.maxY))
        path.addLine(to: CGPoint(x: bounds.minX, y: bounds.maxY))

        // Close the path. This will create the last line automatically.
        path.close()
        fillColor.setFill()
        path.fill()
    }

}
