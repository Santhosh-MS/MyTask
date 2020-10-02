//
//  MyTaskTests.swift
//  MyTaskTests
//
//  Created by admin on 10/1/20.
//  Copyright © 2020 admin. All rights reserved.
//

import XCTest
@testable import MyTask
//MARK:- This testCase only for viewController property only
class MyTaskTests: XCTestCase {
    var viewCtrl : ViewController!
    var viewModel : ViewModelVC!
    var systemUnderTest : ViewController!
   
    //MARK:- setUpview initialization
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.viewCtrl = ViewController()
        self.viewModel = ViewModelVC()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        systemUnderTest = (storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //MARK:- test code for viewCtrl property
    func testViewControllerRef() throws {
        XCTAssertNotNil(self.viewCtrl)
        XCTAssertNotNil(self.viewModel)
        XCTAssertNotNil(self.systemUnderTest.view)
        XCTAssertNil(self.viewCtrl.collectionView)
        XCTAssertNil(self.viewCtrl.nextBtn)
        XCTAssertNil(self.viewCtrl.prevBtn)
        XCTAssertNil(self.viewCtrl.pageControl)
        XCTAssertNil(self.viewCtrl.navigationItem.rightBarButtonItem)
    }
    
     //MARK:- test code for AppConstants
    func testAPPConstant() throws {
        XCTAssertTrue(APP_NAME == "MY..Task", "Name Not Matched")
        XCTAssertTrue(BASE_URL == "https://git.io/fjaqJ", "Name Not Matched")
        XCTAssertFalse(APP_NAME != "MY..Task", "Name Not Matched")
        XCTAssertFalse(BASE_URL != "https://git.io/fjaqJ", "Name Not Matched")
    }
    
     //MARK:- test code for NetworkConnections
    func testNetWorkReachablity() throws {
        XCTAssertTrue(Reachability.shared.isConnectedToNetwork() == true, "Check your Network Connections")
        XCTAssertFalse(Reachability.shared.isConnectedToNetwork() == false, "Check your Network Connections")
    }
    
    //MARK:- test code for CollectionViewDelegate
    func testCollectionDelegate() throws {
        systemUnderTest.viewDidLoad()
        XCTAssertNotNil(systemUnderTest.collectionView.dataSource)
        XCTAssertNotNil(systemUnderTest.collectionView.delegate)
    }
    
    //MARK:- test code for CollectionViewDataSource
    func testCollectionDataSource() throws {
        XCTAssert(self.systemUnderTest.conforms(to: UICollectionViewDataSource.self))
        XCTAssertTrue(systemUnderTest.responds(to:#selector(systemUnderTest.collectionView(_:numberOfItemsInSection:))))
        XCTAssert(self.systemUnderTest.conforms(to: UICollectionViewDelegateFlowLayout.self))
    }
    
    //MARK:- test code for PrevButton
    func testPrevtBtn() throws {
        let button = UIButton()
        button.tag = 0
         var current : Int = 10
        if button.tag == 0 {
            current -= 1
            if current < 0 {
                current = 0
            }
        }
        XCTAssertTrue(current == 9, "When click prev button current val should decress")
    }
    
    //MARK:- test code for NextButton
    func testNexttBtn() throws {
        let button = UIButton()
        button.tag = 1
         var current : Int = 10
        if button.tag == 1 {
            current += 1
            if current >= 10 {
                current = 10
            }
        }
        XCTAssertTrue(current == 10, "current page count when reach max should not refresh")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
