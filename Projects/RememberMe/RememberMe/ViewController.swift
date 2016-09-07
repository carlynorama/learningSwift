//
//  ViewController.swift
//  RememberMe
//
//  Created by carlynorama on 9/7/16.
//  No rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var statusLabel: UILabel!
   
    @IBAction func recordButtonAction(_ sender: AnyObject) {
        
        submitNumber()
    }
    
    @IBAction func numberTextFieldReturn(_ sender: AnyObject) {
        submitNumber()
    }
    
    
    func submitNumber() {
        guard !(numberTextField.text?.isEmpty)! else {
            statusLabel.text = "Number cleared"
            updateNumber(newNumber: "")
            return;
        }
        
        guard let mySubmission:String = numberTextField.text else {
            statusLabel.text = "Nothing changed"
            return
        }
        let myNumber = getPhoneNumber(stringToCheck: mySubmission)
        
        numberTextField.text = myNumber
        
        updateNumber(newNumber: myNumber)
        
        if (numberTextField.text?.isEmpty)! {
            statusLabel.text = "No valid number on record"
        } else {
            statusLabel.text = "\(myNumber) is the number on record"
        }
    
    }
    
    func updateNumber(newNumber: String) {
        UserDefaults.standard.setValue(newNumber, forKey: "Phone Number")
        print("new number saved")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let numberObject = UserDefaults.standard.value(forKey: "Phone Number")
        
        if let phoneNumber = numberObject as? String {
            numberTextField.text! = phoneNumber
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getPhoneNumber(stringToCheck:String) -> String {
        let myDetector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
        let possibleNumbers = myDetector.matches(in: stringToCheck, options: [], range: NSRange(location: 0, length: stringToCheck.utf16.count))
        
        guard possibleNumbers.count == 1 else {
            return ""
        }
        
        let phoneNumber = (stringToCheck as NSString).substring(with:possibleNumbers[0].range)
        return phoneNumber
    }


}





