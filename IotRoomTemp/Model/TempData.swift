//
//  TempData.swift
//  IotRoomTemp
//
//  Created by Muhammad Ilham Ashiddiq Tresnawan on 02/09/20.
//  Copyright © 2020 Muhammad Ilham Ashiddiq Tresnawan. All rights reserved.
//

import Foundation

struct TempData: Codable {
    let feeds: [Feeds]
}

struct Feeds: Codable {
    let field1: String
    
}
