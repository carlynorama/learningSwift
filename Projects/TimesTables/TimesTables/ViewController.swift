//
//  ViewController.swift
//  TimesTables
//
//  Created by carlynorama on 9/1/16.
//  No rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let numberOfResults:Int = 20
    var multiplier:Int = 12
    
    
    @IBOutlet var timesTable: UITableView!
    
    @IBOutlet var sliderValue: UISlider!
    
    @IBAction func sliderAction(_ sender: AnyObject) {
        multiplier = Int(sliderValue.value)
        timesTable.reloadData()
    }

    
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfResults
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier:"Cell")
        let base = indexPath.row+1
        cell.textLabel?.text = String(format:"%d x %d = %d", base , multiplier, base*multiplier)
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderValue.value = Float(multiplier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

