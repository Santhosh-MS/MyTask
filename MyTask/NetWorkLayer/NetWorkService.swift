//
//  NetWorkService.swift
//  MyTask
//
//  Created by admin on 10/1/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
//MARK:- Single Ton Class
class NetWorkService {
    static let shared = NetWorkService()
    var swiperAPI : SwiperApi?
    
    private init(){
        
    }
    
//MARK:- get call URLSession for API Request
    func getDataFromNetwork(endpointApi : SwiperApi,flag : Int,completion : ((_ responsedata : SwiprInfo?,_ status : Bool,_ message : String) -> Void)?){
        
        PrintMsgLog.Console(msg: endpointApi.subUrls)
        guard  let urlRequest = URL(string: endpointApi.subUrls) else
        {
            return
        }
        
        let urlsession = URLSession.shared.dataTask(with: urlRequest) { (data,respons, error) in
            if let err = error {
                PrintMsgLog.Console(msg: err.localizedDescription)
                 completion?(nil,false,err.localizedDescription)
                return
            }
            
            if let response = respons as?  HTTPURLResponse{
                print("sample : StatusCode \(response.statusCode)")
                switch response.statusCode
                {
                case 401:
                    PrintMsgLog.Console(msg: "UnAuthorized : 401")
                    
                case 200:
                    PrintMsgLog.Console(msg: "Success : 200")
                    
                case 400:
                    PrintMsgLog.Console(msg: "Error NotFound : 400")
                default :
                    PrintMsgLog.Console(msg: "Other statement : Code")
                }
            }
            guard let data = data else {
                completion?(nil,false,"getting data nil ")
                return
            }
            
            if let info = self.getDataToSwiperObjet(data: data) {
                completion?(info,true,"")
            }else{
                completion?(nil,false,"error in convert invalid to valid jons")
            }
//            let response = Response(data: data)
//
//            guard let decoded = response.decode(type) else{
//                return
//            }
//            completion?(data)
            
        }
        urlsession.resume()
    }
    //MARK:- Method used to convert valid json info
    func getDataToSwiperObjet(data : Data) -> SwiprInfo? {
        
        guard let changedData  = String(decoding: data, as: UTF8.self).replacingOccurrences(of: "/", with: "").data(using:.utf8) else {
            return nil
        }
        
        do {
             let decode = JSONDecoder()
            return try decode.decode(SwiprInfo.self, from: changedData)
        }catch let err {
            PrintMsgLog.Console(msg: err.localizedDescription)
            return nil
        }
        
    }
    
    
}
