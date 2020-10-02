//
//  CircleButton.swift
//  MyTask
//
//  Created by admin on 10/2/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

@IBDesignable
class CircleButton: UIButton {

    override func layoutSubviews() {
           superview?.layoutSubviews()
           clipsToBounds = true
           
           layer.cornerRadius = 28.0
           
           
       }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
