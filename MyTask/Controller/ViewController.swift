//
//  ViewController.swift
//  MyTask
//
//  Created by admin on 10/1/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit


//MARK:- ViewController Class for SWiperViews
class ViewController: BaseViewController {
    
    
    //MARK:- StoryBoard Outlet Reference
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var prevBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var countLbl: UILabel!
    
    //MARK:- Class leval Instances
    let viewModel  = ViewModelVC()
    var swiperList : [SwiperData] = []
    
    //MARK:- VC viewDidLoad Method
    override func viewDidLoad() {
        super.viewDidLoad()
        //ViewMolde setup
        self.viewModel.viewModelDelegate = self
        
        
        if viewModel.fetchMoviewsList().count > 0 {
            DispatchQueue.main.async {
                self.showLoadingIndicator()
            }
            self.viewModel.getSwiperListInfo()
            self.SetUpView()
        }else{
            if Reachability.shared.isConnectedToNetwork(){
                DispatchQueue.main.async {
                   self.showLoadingIndicator()
               }
                self.viewModel.getSwiperListInfo()
                self.SetUpView()
            }else{
                self.showOKAlert(titles: APP_NAME, msg: "Kindly Check Your NetWork Connection ")
            }
        }
    }

    
//MARK:- func for setupviewCtrl
    func SetUpView() {
        
        //View setup
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        //collectionView setup
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
        
        //navigationItem & Buttons setup
        self.navigationItem.title = APP_NAME
        self.prevBtn.backgroundColor = .white
        self.prevBtn.layer.cornerRadius = 25
        self.nextBtn.layer.cornerRadius = 25
        self.nextBtn.backgroundColor = .white
        self.nextBtn.tintColor = .black
        self.prevBtn.tintColor = .black
        self.nextBtn.tag = 1
        self.prevBtn.tag = 0
        nextBtn.addTarget(self, action: #selector(actionHandleNextPage), for:
            .touchUpInside)
        prevBtn.addTarget(self, action: #selector(actionHandleNextPage), for:
            .touchUpInside)
        
        //pageControl setup
        self.pageControl.numberOfPages = self.swiperList.count
        self.pageControl.currentPage = 0
        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        for cell in collectionView!.visibleCells as [UICollectionViewCell] {
            if let animatedCell = cell as? SwiperCollectionViewCell {
                animatedCell.actionCallanimation()
            }
        }
        
    }
    
    //MARK:- func for setupviewCtrl
    @objc func actionHandleNextPage(button: UIButton) {
        var indexPath: IndexPath!
        var current = pageControl.currentPage
        if button.tag == 0 {
            current -= 1
            if current < 0 {
                current = 0
            }
        } else {
            current += 1
            if current >= swiperList.count {
                current = swiperList.count
                return
            }
        }
        
        DispatchQueue.main.async {
            indexPath = IndexPath(item: current, section: 0)
            self.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        }
    }
    
    
    //MARK:- func for RefershSwiper
    @IBAction func actionRefresh(_ sender: Any) {
        if swiperList.count > 0 {
            DispatchQueue.main.async {
                self.pageControl.currentPage = 0
                self.countLbl.text = "\(self.pageControl.currentPage+1) / \(self.swiperList.count)"
                self.pageControl.numberOfPages = self.swiperList.count
                DispatchQueue.main.async {
                    let indexPath = IndexPath(item: 0, section: 0)
                    self.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
                }
                self.collectionView.reloadData()
            }
        }
    }
}

//MARK:- Extension for CollectionView Delegat Methods

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.swiperList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SwiperCollectionViewCell.identifier, for: indexPath) as? SwiperCollectionViewCell {
            cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            cell.txtLbl.text = self.swiperList[indexPath.row].text ?? ""
            cell.itemImg.image = UIImage(named: "image\(indexPath.row+1)")
            
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
        self.countLbl.text = "\(self.pageControl.currentPage+1) / \(self.swiperList.count)"
        
        for cell in collectionView!.visibleCells as [UICollectionViewCell] {
            if let animatedCell = cell as? SwiperCollectionViewCell {
                animatedCell.actionCallanimation()
            }
        }
        
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        for cell in collectionView!.visibleCells as [UICollectionViewCell] {
            if let animatedCell = cell as? SwiperCollectionViewCell {
                animatedCell.actionCallanimation()
            }
        }
    }
    
}

//MARK:- Extension for customeDelegate method to getData
extension ViewController : SendDataProtocol {
    func getSwiperData(dataSwiper: [SwiperData]) {
        PrintMsgLog.Console(msg: " --\(dataSwiper)")
        if dataSwiper.count > 0  {
            self.swiperList.removeAll()
            self.swiperList = dataSwiper
            self.reloadDataInfo()
        }else{
            PrintMsgLog.Console(msg: "SwiperList info [] Empty Return ")
            
        }
    }
    
    //MARK:- Func for reload getDatainfo
    func reloadDataInfo() {
        DispatchQueue.main.async {
            self.hideLoadingIndicator()
            self.pageControl.currentPage = 0
            self.countLbl.text = "\(self.pageControl.currentPage+1) / \(self.swiperList.count)"
            self.pageControl.numberOfPages = self.swiperList.count
            self.collectionView.reloadData()
        }
    }
}

