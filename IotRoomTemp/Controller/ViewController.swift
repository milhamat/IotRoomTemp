//
//  ViewController.swift
//  IotRoomTemp
//
//  Created by Muhammad Ilham Ashiddiq Tresnawan on 02/09/20.
//  Copyright © 2020 Muhammad Ilham Ashiddiq Tresnawan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var tempManager = TempManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //statusLabel.text = "Hi There.. !"
        
        tempManager.delegate = self
        
        //Timer.scheduledTimer(timeInterval: 20, target: self, selector: #selector(updateTemp), userInfo: nil, repeats: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

    @IBAction func updateButtonPressed(_ sender: UIButton) {
        tempManager.fectTemperature()
        let genrateHaptic = UIImpactFeedbackGenerator(style: .medium)
        genrateHaptic.impactOccurred()
    }
    //    @objc func updateTemp(){
//        tempManager.fectTemperature()
//        print("take")
//    }
}

extension ViewController: TemperatureManagerDelegate {
    
    func didUpdateTemperature(_ tempManager: TempManager, temp: TempModel) {
        
        DispatchQueue.main.sync {
            self.tempLabel.text = temp.tempString
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
