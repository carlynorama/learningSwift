//
//  ViewController.swift
//  Prime Number Checker iOS10
//
//  Created by Carlyn Maw on 8/24/16.
//  Copyright © 2016 carlynorama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var successColor = UIColor(red: 0, green: 0.5, blue: 0.5, alpha: 1)
    
    var failColor = UIColor(red: 1, green: 0.3, blue: 0.3, alpha: 1)
    
    @IBOutlet var returnMessage: UILabel!
    
    @IBOutlet var userSubmitField: UITextField!
    

    @IBAction func numberSubmitField(_ sender: AnyObject) {
        submitNumber(userSubmission: userSubmitField.text)
    }
    
    @IBAction func submitButton(_ sender: AnyObject) {
        submitNumber(userSubmission: userSubmitField.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userSubmitField.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func submitNumber(userSubmission: String?) {
        print(userSubmission)
        guard let userSubmittedNumber:Int = Int(userSubmission!) else {
            returnMessage.textColor = failColor
            returnMessage.text = "Please submit a number."
            return
        }
        
        if isPrime(checkMe: userSubmittedNumber) {
            returnMessage.textColor = successColor
            returnMessage.text = "It's a prime!"
        } else {
            returnMessage.textColor = failColor
            returnMessage.text = "Sorry, not prime!"
        }
        
        

    }
    

}

