//
//  ViewController.swift
//  KeyBoard
//
//  Created by carlynorama on 9/8/16.
//  No rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func textFieldPrimaryActionTriggered(_ sender: AnyObject) {
        print("Do Something")
        sender.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

// ALTERNATIVE FOR LINKING RETURN BUTTON
// ALSO MAKE ViewController have UITextViewDelegate protocol somehow
//    func textFieldShouldReturn(textField: UITextField!) -> Bool {
//        
//        //textField code
//        
//        let myReturnBool = textField.resignFirstResponder()  //if desired
//        //performAction()
//        return myReturnBool
//    }
    
}

