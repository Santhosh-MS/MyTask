//
//  Response.swift
//  MyTask
//
//  Created by admin on 10/1/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

//MARK:- This Response Struct for decoding response from API
struct Response : Codable {
    fileprivate var data : Data
     init(data : Data){
        self.data = data
    }
}

//MARK:- Extension Response
extension Response{
//MARK:- Generic func for to Decode Api response 
    public func decode<T : Codable>(_ type : T.Type ) -> T? {
// let jsonDecoder = JSONDecoder()
        do{
            let response = try JSONDecoder().decode(T.self, from:data)
            return response
        }catch let error {
            PrintMsgLog.Console(msg: "error : \(error.localizedDescription)")
            return nil
        }
  }
}
