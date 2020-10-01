//
//  ViewModelVC.swift
//  MyTask
//
//  Created by admin on 10/1/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import CoreData

//MARK:- Custome protocol for send data
protocol SendDataProtocol{
    func getSwiperData(dataSwiper: [SwiperData]) -> Void
}

//MARK:- ViewModel Class for ViewController
class ViewModelVC{
    //instance form NetworkLayer
    let httpClient = NetWorkService.shared
    var viewModelDelegate : SendDataProtocol?
    
//MARK:- func for get Swiper List from Api
    func getSwiperListInfo() -> Void{
        let SwiperFetchInfo = fetchMoviewsList()
        if SwiperFetchInfo.count > 0 {
            self.viewModelDelegate?.getSwiperData(dataSwiper: SwiperFetchInfo)
        }else{
            self.httpClient.getDataFromNetwork(endpointApi: SwiperApi.baseUrl, flag: 0) { (SwiperList, status, message) in
                if status {
                    if let swiperDatainfo = SwiperList {
                        self.addDataToSwiperTable(dataSwiperList: swiperDatainfo.data)
                    }
                    
                }else{
                    PrintMsgLog.Console(msg: message)
                }
            }
        }
        
    }
}

//MARK:- extension for CoreData Stack
extension ViewModelVC {
   
//MARK:- Insert Data Into Swiper LocalTable
    func addDataToSwiperTable(dataSwiperList : [Datum]){
        do{
            for swiper in dataSwiperList{
                guard let swiperDB = NSEntityDescription.insertNewObject(forEntityName: "SwiperData", into: CoreDataManager.shared.manageObjectContext) as?  SwiperData else{
                    return
                }
                swiperDB.id = swiper.id
                swiperDB.text = swiper.text
            }
            try CoreDataManager.shared.manageObjectContext.save()
        }catch let err as NSError{
            PrintMsgLog.Console(msg: err.localizedDescription)
        }
    }
    
    
    
//MARK:- Fetch Data from Swiper LocalTable
    func fetchMoviewsList() -> [SwiperData]{
        let swiperList = NSFetchRequest<NSFetchRequestResult>(entityName: "SwiperData")
        do{
            guard let resultSwiper =  try CoreDataManager.shared.manageObjectContext.fetch(swiperList) as? [SwiperData] else {
                return []
            }
            PrintMsgLog.Console(msg: "Swipercount_DB : \(resultSwiper.count)")
            if resultSwiper.count > 0 {
                return resultSwiper
            }else{
                return []
            }
        }catch let err as NSError {
            PrintMsgLog.Console(msg: err.localizedDescription)
            return []
        }
    }
}
