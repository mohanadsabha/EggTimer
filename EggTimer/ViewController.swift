//
//  ViewController.swift
//  EggTimer
//
//  Created by Mohanad on 26/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    let eggTime = ["Soft": 3, "Medium": 5, "Hard": 7]
    var timeRemaining = 60
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        timeRemaining = eggTime[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        if timeRemaining > 0 {
            print("\(timeRemaining) seconds.")
            timeRemaining -= 1
        }
        else {
            timer.invalidate()
            label.text = "DONE!"
        }
    }
}
