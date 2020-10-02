//
//  CardView.swift
//  MyTask
//
//  Created by admin on 10/2/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

//MARK:- Custom Designable class for cardView
@IBDesignable
class CardView: UIView {

//MARK:- layoutSubviews for views
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

}
