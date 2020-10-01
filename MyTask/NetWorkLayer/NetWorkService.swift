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
    func getDataFromNetwork<T: Codable>(endpointApi : SwiperApi,flag : Int,type : T.Type,completion : ((_ responsedata : T) -> Void)?){    //by default get method will be called
        PrintMsgLog.Console(msg: endpointApi.subUrls)
        guard  let urlRequest = URL(string: endpointApi.subUrls) else
        {
            return
        }
        
        let urlsession = URLSession.shared.dataTask(with: urlRequest) { (data,respons, error) in
            if let err = error {
                PrintMsgLog.Console(msg: err.localizedDescription)
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
                return
            }
            let response = Response(data: data)
            
            guard let decoded = response.decode(type) else{
                return
            }
            completion?(decoded)
            
        }
        urlsession.resume()
    }
}
