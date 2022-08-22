//
//  ViewController.swift
//  StopWatch
//
//  Created by 堀弘昌 on 2022/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var message: UILabel!
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        message.isHidden = true
    }

    @IBAction func start(){
        
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
        message.isHidden = true
    }

    @IBAction func stop(){
        
        if timer.isValid {
            timer.invalidate()
        }
        
        self.hantei()
    }
    
    @objc func up(){
        count = count + 0.01
        label.text = String(format: "%.2f", count)
    }
    
    @IBAction func reset(){
        
        if timer.isValid {
            timer.invalidate()
        }
        
        count = 0
        label.text = String(format: "%.2f", count)
    }
    
    @objc func hantei(){
        
        if abs(count - 10.0) <= 0.20{
            message.text = "PERFECT"
        }
        else if abs(count - 10.0) <= 0.30{
            message.text = "GREAT"
        }
        else if abs(count - 10.0) <= 0.50{
            message.text = "GOOD"
        }
        else {
            message.text = "BAD"
        }
        
        message.isHidden = false
    }
}

