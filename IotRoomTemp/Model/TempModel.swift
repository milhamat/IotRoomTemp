//
//  TempModel.swift
//  IotRoomTemp
//
//  Created by Muhammad Ilham Ashiddiq Tresnawan on 02/09/20.
//  Copyright © 2020 Muhammad Ilham Ashiddiq Tresnawan. All rights reserved.
//

import Foundation

struct TempModel {
    let temperature: String
        
    var tempString: String {
        let index = temperature.firstIndex(of: ".") ?? temperature.endIndex
        let beginning = temperature[..<index]
        
        let format: String = "\(beginning)°C"
        return format
    }
}
