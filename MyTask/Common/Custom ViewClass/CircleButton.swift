//
//  CircleButton.swift
//  MyTask
//
//  Created by admin on 10/2/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

//MARK:- Custom Designable class for CircleView
@IBDesignable
class CircleButton: UIButton {

//MARK:- layoutSubviews for views
override func layoutSubviews() {
       superview?.layoutSubviews()
       clipsToBounds = true
       layer.cornerRadius = 28.0
}
}
