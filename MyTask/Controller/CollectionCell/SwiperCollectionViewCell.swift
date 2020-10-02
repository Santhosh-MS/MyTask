//
//  SwiperCollectionViewCell.swift
//  MyTask
//
//  Created by admin on 10/2/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SwiperCollectionViewCell: UICollectionViewCell {
 
    @IBOutlet weak var cellView: UIView!
    //Variable for identifier
   
    static let identifier = "SwiperCollectionViewCell"
    static let nib = UINib(nibName: "SwiperCollectionViewCell", bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
