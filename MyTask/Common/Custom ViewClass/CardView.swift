//
//  CardView.swift
//  MyTask
//
//  Created by admin on 10/2/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UIView {
    
    override func layoutSubviews() {
        superview?.layoutSubviews()
     
        clipsToBounds = true
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.cornerRadius = 5.0
        layer.borderColor  =  UIColor.clear.cgColor
        layer.borderWidth = 2.0
        layer.shadowOpacity = 0.5
        layer.shadowColor =  UIColor.lightGray.cgColor
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width:5, height: 5)
        layer.masksToBounds = true
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
