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
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var prevBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let viewModel  = ViewModelVC()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.SetUpView()
    }
    
//MARK:- func for setupviewCtrl
    func SetUpView() {
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.viewModel.viewModelDelegate = self
        self.viewModel.getSwiperListInfo()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(SwiperCollectionViewCell.nib, forCellWithReuseIdentifier: SwiperCollectionViewCell.identifier)
        self.collectionView.isPagingEnabled = true
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.showsVerticalScrollIndicator = false
        let layout: UICollectionViewFlowLayout = self.collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.navigationItem.title = APP_NAME
        self.prevBtn.backgroundColor = .white
        self.prevBtn.layer.cornerRadius = 25
        self.nextBtn.layer.cornerRadius = 25
        self.nextBtn.backgroundColor = .white
        self.nextBtn.tintColor = .black
        self.prevBtn.tintColor = .black
        self.nextBtn.tag = 1
        self.prevBtn.tag = 0
        nextBtn.addTarget(self, action: #selector(handleNextPage), for:
        .touchUpInside)
        prevBtn.addTarget(self, action: #selector(handleNextPage), for:
        .touchUpInside)
        self.pageControl.numberOfPages = 10
        self.pageControl.currentPage = 0
         self.pageControl.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func handleNextPage(button: UIButton) {
            
        print("button Tag :\(button.tag)")
            var indexPath: IndexPath!
            var current = pageControl.currentPage

            if button.tag == 0 {
                current -= 1
                if current < 0 {
                    current = 0
                }
            } else {
                current += 1
                if current > 10 {
                    current = 0
                }
            }

            indexPath = IndexPath(item: current, section: 0)
        DispatchQueue.main.async {
            self.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)

        }
            
    }

}

//MARK:- Extension for Collection viewController

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
           return 1
       }
       
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 10
   }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SwiperCollectionViewCell.identifier, for: indexPath) as? SwiperCollectionViewCell {
            Call(val: indexPath.row)
            cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            return cell
        }else{
            return UICollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollPos = scrollView.contentOffset.x / view.frame.width
        pageControl.currentPage = Int(scrollPos)
    }
}



//MARK:- Extension for customeDelegate method to get data

extension ViewController : SendDataProtocol {
    func getSwiperData(dataSwiper: [SwiperData]) {
        PrintMsgLog.Console(msg: " --\(dataSwiper)")
    }
    
    func Call(val :Int) {
        print("info : \(val)")
    }
}




