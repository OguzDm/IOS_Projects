//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var progressLabel: UIProgressView!
    
    let softTime = 5
    let midTime = 7
    let hardTime = 12
    

    var totalTime:Float = 0
    var secondPassed:Float = 0
     
    let eggTimer : [String:Float] = ["Soft":300.0,"Medium":400.0,"Hard":700.0]
    
    var timer = Timer()
    
    @IBAction func hardness(_ sender: UIButton) {
        let  hardness = sender.currentTitle!
        
        timer.invalidate()
        progressLabel.progress = 0.0
        secondPassed = 0.0
        labelView.text = hardness
        
        
        totalTime = Float(eggTimer[hardness]!)
        
        timer=Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    @objc func updateTimer(){
        if secondPassed <= totalTime{
            print(secondPassed, "\n")
            print(totalTime,"\n")
            let percentageProgress = secondPassed / totalTime
            progressLabel.progress = Float(percentageProgress)
            secondPassed += 1.0
            
            
        }
        else {
            timer.invalidate()
            labelView.text = "DONE!!!"
        }
        
    }
    
}
