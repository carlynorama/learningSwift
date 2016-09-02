//
//  ViewController.swift
//  myTimer
//
//  Created by carlynorama on 8/31/16.
//  No rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var orderUpChimeSoundID:SystemSoundID = 1016
    var myTimer = Timer()
   
    var defaultTime = 210
    var timeLeft = Int()
    
    
    @IBAction func startButtonAction(_ sender: AnyObject) {
        startTimer()
    }
    
    
    @IBAction func pauseButtonAction(_ sender: AnyObject) {
        pauseTimer()
    }
    
    
    @IBOutlet var displayTextField: UILabel!
    @IBOutlet var playButton: UIBarButtonItem!
    @IBOutlet var pauseButton: UIBarButtonItem!
    @IBOutlet var minus10Button: UIBarButtonItem!
    @IBOutlet var plus10Button: UIBarButtonItem!
    
    
    @IBAction func minus10ButtonAction(_ sender: AnyObject) {
        adjustTimeDown(howMuch: 10)
    }
    
    
    @IBAction func plus10ButtonAction(_ sender: AnyObject) {
        adjustTimeUp(howMuch: 10)
    }
    
    @IBAction func resetButtonAction(_ sender: AnyObject) {
        resetTimer()
    }
    
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        let h = seconds / 3600
        let m = (seconds % 3600) / 60
        let s = (seconds % 60)
        return (h, m, s)
    }
    
    
    func pauseTimer() {
        myTimer.invalidate()
        setUIPauseState()
    }
    
    func startTimer() {
        if !myTimer.isValid {
                    myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)        }
        else {
            print("already running, thanks")
        }
        
        setUIPlayState()
        
    }
    
    func resetTimer() {
        timeLeft = defaultTime
        myTimer.invalidate()
        updateTimeDisplay()
        setUIPauseState()
    }
    
    func updateTimer() {
        
        guard timeLeft > 0 else {
            timerFinish()
            return
        }
        
            timeLeft -= 1
            updateTimeDisplay()
        
    }
    
    func updateTimeDisplay() {
        //requires using monospaced font.
        let (h, m, s) = secondsToHoursMinutesSeconds(seconds: timeLeft)
        let timeToDisplay = String(format:"%02d:%02d:%02d", h, m, s)
        displayTextField.text  = timeToDisplay
        //print("The time ellapsed is %02d:%02d:%02d", h, m, s)
    }
    
    
    func adjustTimeUp(howMuch: Int) {
    
        timeLeft += howMuch
        updateTimeDisplay()
        
    }
    
    func adjustTimeDown(howMuch: Int) {
        
        if timeLeft > howMuch {
            timeLeft -= howMuch
        } else {
            timeLeft = 0
        }
        
        updateTimeDisplay()
        
    }
    
    func timerFinish() {
        AudioServicesPlaySystemSound (orderUpChimeSoundID)
        setUIFinishState()
        
    }
    
    func setUIPlayState() {
        pauseButton.isEnabled = true
        playButton.isEnabled = false
        plus10Button.isEnabled = true
        minus10Button.isEnabled = true
        
    }
    
    func setUIPauseState() {
        playButton.isEnabled = true
        pauseButton.isEnabled = false
        plus10Button.isEnabled = true
        minus10Button.isEnabled = true
    }
    
    func setUIFinishState() {
        pauseButton.isEnabled = false
        playButton.isEnabled = false
        plus10Button.isEnabled = false
        minus10Button.isEnabled = false
        displayTextField.text = "Egg Ready!"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        timeLeft = defaultTime
        updateTimeDisplay()
        setUIPauseState()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

