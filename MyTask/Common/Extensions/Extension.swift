//
//  Extension.swift
//  MyTask
//
//  Created by admin on 10/2/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

//MARK:-Extension : UIActivityIndicatorView
extension UIActivityIndicatorView{
    //MARK:- Assign color to UIActivityIndicatorView
    func assignColor(_ color: UIColor) {
        style = .large
        self.color = color
    }
}
