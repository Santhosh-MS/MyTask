//
//  NetWorkModel.swift
//  MyTask
//
//  Created by admin on 10/1/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
//MARK:-  enum SwiperAPi
enum SwiperApi {
    case baseUrl
}
//MARK:- extension enum EndPointApi
extension SwiperApi : EndPointApi{
    var subUrls: String {
    switch self{
        case .baseUrl:
               return BASE_URL
        }
    }
}
