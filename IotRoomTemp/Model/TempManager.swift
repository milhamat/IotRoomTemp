//
//  TempManager.swift
//  IotRoomTemp
//
//  Created by Muhammad Ilham Ashiddiq Tresnawan on 02/09/20.
//  Copyright © 2020 Muhammad Ilham Ashiddiq Tresnawan. All rights reserved.
//

import Foundation

protocol TemperatureManagerDelegate{
    func didUpdateTemperature(_ tempManager: TempManager, temp: TempModel)
    func didFailWithError(error: Error)
}

struct TempManager {
    let tempURL = "https://api.thingspeak.com/channels/1128406/feeds.json?api_key=0ZG70T0Z0EFGB0TT&results=2"
    
    func fectTemperature(){
        let callUrl = tempURL
        performRequest(with: callUrl)
    }
    
    var delegate: TemperatureManagerDelegate?
    
    func performRequest(with url: String){
        
        if let urlSession = URL(string: url){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: urlSession) { (data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data{
                    if let temp = self.parseJson(tempData: safeData){
                        self.delegate?.didUpdateTemperature(self, temp: temp)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJson(tempData: Data) -> TempModel? {
        
        let decoder = JSONDecoder()
        do{
        let decodeData = try decoder.decode(TempData.self, from: tempData)
            
            let temp = decodeData.feeds[1].field1
            
            let temperature = TempModel(temperature: temp)
            
            return temperature
        } catch {
         // Add Protocol error
            return nil
        }
    }
}
