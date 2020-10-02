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
     
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.cornerRadius = 5.0
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = 5
        clipsToBounds = false
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
