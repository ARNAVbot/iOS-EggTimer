//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggCookTimes = [
        "Soft" : 5,
        "Medium": 7,
        "Hard": 12
    ]
    
    let eggTimes = [
        "Soft": 3,
        "Medium": 4,
        "Hard" : 7
    ]
    
//    var secondsRemaining = 60
    
    var timer = Timer()
    
    var totalTime = 0
    var secondsPassed = 0
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        progressBar.progress = 0.0
        
        let hardness = sender.currentTitle!
        
        timer.invalidate()
        secondsPassed = 0
        titleLabel.text = hardness
        
        if hardness == "Soft" {
            print(softTime)
        } else if hardness == "Medium" {
            print(mediumTime)
        } else {
            print(hardTime)
        }
        
        switch hardness {
        case "Soft":
            print(softTime)
        case "Medium":
            print(mediumTime)
        case "Hard":
            print(hardTime)
        default:
            print("Error")
        }
        
        print(eggCookTimes[hardness]!)
        
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                             target: self,
                             selector: #selector(updatetimer),
                             userInfo: nil,
                            repeats: true)
    }
    
    @objc func updatetimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentageProgress = (Float(secondsPassed) / Float(totalTime))
            progressBar.progress = percentageProgress
//            print("\(secondsPassed) seconds.")
        } else {
            // the following statement is done to stop the timer , so that it does not keep calling this method after every second.
            timer.invalidate()
            titleLabel.text = "Done"
        }
    }

    
}
