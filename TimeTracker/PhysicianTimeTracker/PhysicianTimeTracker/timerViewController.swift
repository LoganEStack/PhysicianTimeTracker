//
//  TimerViewController.swift
//  PhysicianTimeTracker
//
//  Created by Vedant Tiwari on 3/27/18.
//  Copyright © 2018 ShippertLLC. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var timerLabel:UILabel!
    
    var seconds = 0
    var timer = Timer()
    var isTimerRunning = false
    
    @IBAction func timerButtonClicked(_ sender: UIButton)
    {
        if(isTimerRunning == false)
        {
            runTimer(UIButton)
        }
        else
        {
            stopTimer(sender: UIButton)
        }
    }
    
    func runTimer(_ sender: UIButton)
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(TimerViewController.updateTimer)), userInfo: nil, repeats: true)
        
        isTimerRunning = true
        sender.setTitle("DONE", for: .normal)
        sender.backgroundColor = .red
    }
    
    func stopTimer(sender: UIButton)
    {
        timer.invalidate()
        isTimerRunning = false
        sender.setTitle("START", for: .normal)
        sender.backgroundColor = .green
    }
    
    @objc func updateTimer()
    {
        seconds += 1
        timerLabel.text = timeString(time: TimeInterval(seconds))
    }
    
    func timeString(time:TimeInterval) -> String
    {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
