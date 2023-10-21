//
//  ViewController.swift
//  clicker
//
//  Created by user on 10/20/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var clickButton: UIButton!
    @IBOutlet weak var clickLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var plusClickButton: UIButton!
    @IBOutlet weak var plusTimeButton: UIButton!
    @IBOutlet weak var addClickPriceLabel: UILabel!
    @IBOutlet weak var addTImePriceLabel: UILabel!
    
    var clicks = 0 {
        didSet {
            clickLabel.text = "Clicks: \(clicks)"
        }
    }
    
    var time = 30 {
        didSet {
            timeLabel.text = "Time: \(time)"
        }
    }
    
    var addClick = 1
    var addClickPrice = 30 {
      didSet {
        addClickPriceLabel.text = "Upgrade click:\(addClickPrice)"
      }
    }
    
    var timePrice = 100 {
        didSet {
            addTImePriceLabel.text = "More time:\(timePrice)"
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        clickButton.layer.cornerRadius = 16
        
        startButton.isUserInteractionEnabled = true
        clickButton.isUserInteractionEnabled = false
    }
    
    

    @IBAction func startButtonAction(_ sender: Any) {
        countdownTimer()
        startButton.isUserInteractionEnabled = false
        clickButton.isUserInteractionEnabled = true
        
        time = 30
        clicks = 0
        addClick = 1
        addClickPrice = 30
        timePrice = 100
    }
    
    @IBAction func clickButtonAction(_ sender: Any) {
        clicks += addClick
    }
    
    
    @IBAction func plusClicksButton(_ sender: Any) {
        if clicks >= addClickPrice {
            clicks -= addClickPrice
            addClick += 1
            addClickPrice *= 3
        }
    }
    
    @IBAction func plusTimeButton(_ sender: Any) {
        if clicks >= timePrice{
            time = 30
            timePrice *= 2
        }
    }
    
    func countdownTimer() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            if self.time > 0 {
                self.time -= 1
                self.countdownTimer()
            } else {
                self.startButton.isUserInteractionEnabled = true
                self.clickButton.isUserInteractionEnabled = false
                self.timeLabel.text = "Game over"
            }
        }
    }
}

