//
//  ViewController.swift
//  MultviewsTest
//
//  Created by Carlynorama on 9/7/16.
//  No rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func unwindToMainView(sender: UIStoryboardSegue) {
        //let mySourceViewController = sender.source
        print("unwind from test ViewController")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Start Here View Loaded!")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

