//
//  ViewController.swift
//  Hello World iOS10
//
//  2016 carlynorama. No rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var numberOfCupsTextField: UITextField!
    
    @IBOutlet var mgCaffineResultLabel: UILabel!

    @IBAction func confessButton(_ sender: AnyObject) {
        
        guard !(numberOfCupsTextField.text?.isEmpty)! else {
            print("no no no no")
            return;
        }
        
        //not necessary if using numeric only keyboard, but hey, good to
        //have on file
        guard let cupsValue:Double = Double(numberOfCupsTextField.text!) else {
            print("no no no no 2")
            return;
        }
        
        print("go go go")
        let message = "Forgive me Coffea arabica, I have drunk \(numberOfCupsTextField.text!) cups of coffee.";
        print(message);
        let amountOfCaffinePerCup:Double = 150;
        let totalCaffine = cupsValue * amountOfCaffinePerCup;
        let unit = "mg";
        let substance = "caffine";
        mgCaffineResultLabel.text = String(format: "%.0f %@ of %@ today.", totalCaffine, unit, substance);
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

