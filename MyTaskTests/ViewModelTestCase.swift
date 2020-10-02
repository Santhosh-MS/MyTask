//
//  ViewModelTestCase.swift
//  MyTaskTests
//
//  Created by admin on 10/2/20.
//  Copyright © 2020 admin. All rights reserved.
//

import XCTest
@testable import MyTask

class ViewModelTestCase: XCTestCase {
        
    var viewCtrl : ViewController!
    var viewModel : ViewModelVC!
    let netWorkObj  = NetWorkService.shared
     
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.viewCtrl = ViewController()
        self.viewModel = ViewModelVC()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchDataEmpty() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let swipInfo = self.viewModel.fetchMoviewsList()
        if swipInfo.count > 0 {
            XCTAssertTrue(swipInfo.count > 0 ,"swiperdata fetched from Local DB value not exist ")
        }else{
            XCTAssertTrue(swipInfo.count == 0 ," swiperdata Empty Local DB")
        }
    }
    
    //MARK:- test code for requestData
        func  testGetDataFormApi() throws{
            
            let exp = expectation(description: "\(#function)\(#line)")

            self.netWorkObj.getDataFromNetwork(endpointApi: SwiperApi.baseUrl, flag: 0) { (swiperInfo, status, message) in
                if status {
                    exp.fulfill()
                     XCTAssertTrue(status)
                }else{
                    exp.fulfill()
                      XCTAssertFalse(status)
                }
            }
             waitForExpectations(timeout: 30, handler: nil)
    }
    
    //MARK:- testCode for InValid Data response form API
    func testFetchInvlidDataEmpty() throws {
        let datainfo = """
        /{
            "data": [
                {
                    "id": "1",
                    "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                },
                {
                    "id": "2",
                    "text": "Felis donec et odio pellentesque diam volutpat commodo sed. Non arcu risus quis varius quam quisque. Nibh nisl condimentum id venenatis a condimentum vitae. Vel pharetra vel turpis nunc eget. "
                },
                {
                    "id": "3",
                    "text": "Volutpat sed cras ornare arcu dui vivamus arcu felis bibendum. Lobortis mattis aliquam faucibus purus in. Aliquam sem fringilla ut morbi tincidunt augue interdum."
                }
                
            ]
        }
        """.data(using: .utf8)
        
        let info = self.netWorkObj.getDataToSwiperObjet(data: datainfo!)
        
        if (info?.data.count)! > 0 {
            XCTAssertTrue((info?.data.count)! > 0)
        }else{
            XCTAssertFalse((info?.data.count)! > 0)
        }
    }
    
   //MARK:- testCode for InValid Data response form API
    func testFetchVlidDataEmpty() throws {
        
        
        let datainfo = """
        {
            "data": [
                {
                    "id": "1",
                    "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                },
                {
                    "id": "2",
                    "text": "Felis donec et odio pellentesque diam volutpat commodo sed. Non arcu risus quis varius quam quisque. Nibh nisl condimentum id venenatis a condimentum vitae. Vel pharetra vel turpis nunc eget. "
                },
                {
                    "id": "3",
                    "text": "Volutpat sed cras ornare arcu dui vivamus arcu felis bibendum. Lobortis mattis aliquam faucibus purus in. Aliquam sem fringilla ut morbi tincidunt augue interdum."
                }
                
            ]
        }
        """.data(using: .utf8)
        
        let info = self.netWorkObj.getDataToSwiperObjet(data: datainfo!)
        
        if (info?.data.count)! > 0 {
            XCTAssertTrue((info?.data.count)! > 0)
        }else{
            XCTAssertFalse((info?.data.count)! > 0)
        }
    }
    

    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
