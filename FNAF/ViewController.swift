//
//  ViewController.swift
//  FNAF
//
//  Created by Panja on 11/26/15.
//  Copyright © 2015 Panja. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var TimeL: NSTextField!
    
    @IBOutlet weak var BatteryL: NSTextField!
    
    @IBOutlet weak var Subtract: NSButton!
    
    @IBOutlet weak var StartReset: NSButton!
    
    var running = false;
    var Battery = 25;
    var Time = 3600
    
    //Timer Variables
    var TimerCountM = 5;
    var TimerCountS = 60;
    var TimerRunning = false;
    var TimerM = NSTimer();
    var TimerS = NSTimer();
    var Toggle = false;
    //Converting Seconds -> Minutes
    var Minutes = 5;
    var Seconds = 0;
    var Div = 0;
    
    func Countdown(){
        //Time Left Before Bomb Explodes
        TimerCountM -= 1
        if(TimerCountM <= 0){
            TimeL.stringValue = "\(TimerCountM):\(TimerCountS)"
        }else{
            /*
            Div = TimerCount / 60
            Minutes = Div;
            
            Seconds = 3600 - (Minutes * 60);

            TimeL.stringValue = "\(Minutes) : \(Seconds)"
            */
            TimeL.stringValue = "\(TimerCountM):\(TimerCountS)"
            Time = TimerCountM
            
        }
    }
    func CountdownS(){
        //Time Left Before Bomb Explodes
        TimerCountS -= 1
        if(TimerCountS <= 0){
            TimeL.stringValue = "\(TimerCountM):00"
            if(Minutes > 0){
                TimerCountS = 60;
            }
        }else if(TimerCountS <= 9){
            TimeL.stringValue = "\(TimerCountM):0\(TimerCountS)"
        }else{
            /*
            Div = TimerCount / 60
            Minutes = Div;
            
            Seconds = 3600 - (Minutes * 60);
            
            TimeL.stringValue = "\(Minutes) : \(Seconds)"
            */
            TimeL.stringValue = "\(TimerCountM):\(TimerCountS)"
            Time = TimerCountS
            
        }
    }
    
    @IBAction func ToggleButton(sender: AnyObject) {
        //If The Button Is At Its Default at 45 Seconds & Not Running
        if(Toggle == false){
            if TimerRunning == false{
                TimerM = NSTimer.scheduledTimerWithTimeInterval(60, target: self, selector: Selector("Countdown"), userInfo: nil, repeats: true)
                TimerS = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("CountdownS"), userInfo: nil, repeats: true)
                TimerRunning = true;
                Toggle = true;
            }
            //If TimerM is Running & Needs To Be Stopped
        }else if (Toggle == true){
            if TimerRunning == true{
                TimerM.invalidate()
                TimerS.invalidate()
                TimerRunning = false
                TimerCountM = 5;
                TimerCountS = 60;
                TimeL.stringValue = "6:00"
                Battery = 25;
                BatteryL.stringValue = "25"
                Toggle = false;
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        running = false;
        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
        
    @IBAction func OnSub(sender: AnyObject) {
        if(Battery > 0){
            Battery -= 1;
            BatteryL.stringValue = "\(Battery)"
        }else{
            BatteryL.stringValue = "0"
        }
    }
    
    
    

}

