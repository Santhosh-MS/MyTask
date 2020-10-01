//
//  PrintMsgLog.swift
//  MyTask
//
//  Created by admin on 10/1/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

//MARK:- class for Console PrintLog
class PrintMsgLog{
    static  var count : Int = 0
    static func Console(msg: String){
        PrintMsgLog.count = PrintMsgLog.count + 1
        print(" \(PrintMsgLog.count)-----\(msg)-----")
    }
}
