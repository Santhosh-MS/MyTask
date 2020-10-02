//
//  SwiperCollectionViewCell.swift
//  MyTask
//
//  Created by admin on 10/2/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

//MARK: Custom Collection Cell class
class SwiperCollectionViewCell: UICollectionViewCell {
    //Outlet referance
    @IBOutlet weak var itemImg: UIImageView!
    @IBOutlet weak var txtLbl: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    
//MARK:- Class leval Static variables
    static let identifier = "SwiperCollectionViewCell"
    static let nib = UINib(nibName: "SwiperCollectionViewCell", bundle: nil)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
//MARK:- Class leval Static variables
    func actionCallanimation() {
    self.txtLbl.alpha = 0.0
    UIView.animate(withDuration: 0.45, delay:0.2 , options: .curveEaseIn, animations: {
        self.txtLbl.alpha = 0.9
    }, completion: nil)
    }

}
