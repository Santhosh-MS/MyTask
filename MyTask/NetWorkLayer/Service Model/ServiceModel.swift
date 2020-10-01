//
//  ServiceModel.swift
//  MyTask
//
//  Created by admin on 10/1/20.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
// MARK: - SwiprInfo List swiper class
class SwiprInfo: Codable {
    let data: [Datum]

    init(data: [Datum]) {
        self.data = data
    }
}

// MARK: - Datum
class Datum: Codable {
    let id, text: String

    init(id: String, text: String) {
        self.id = id
        self.text = text
    }
}
