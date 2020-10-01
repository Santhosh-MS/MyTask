//
//  ViewController.swift
//  MyTask
//
//  Created by admin on 10/1/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //viewModel instance
    let viewModel  = ViewModelVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.SetUpView()
    }

//MARK:- func for setupviewCtrl
    func SetUpView() {
        self.viewModel.viewModelDelegate = self
        self.viewModel.getSwiperListInfo()
    }

}

//MARK:- Extension for customeDelegate method to get data

extension ViewController : SendDataProtocol {
    func getSwiperData(dataSwiper: [SwiperData]) {
        PrintMsgLog.Console(msg: " --\(dataSwiper)")
    }
    
    
}




