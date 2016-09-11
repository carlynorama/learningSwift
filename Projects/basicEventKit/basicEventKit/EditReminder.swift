//
//  EditReminder.swift
//  basicEventKit
//
//  Created by Carlyn Maw on 9/11/16.
//  Copyright © 2016 carlynorama. All rights reserved.
//

import UIKit
import EventKit

class EditReminder: UIViewController {
    
    var reminder: EKReminder!
    var eventStore: EKEventStore!
    
    @IBOutlet var reminderTextField: UITextField!
    
    @IBAction func saveNavButton(_ sender: AnyObject) {
        self.reminder.title = reminderTextField.text!
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        let dueDateComponents = appDelegate.dateComponentFromNSDate(self.datePicker.date)
//        reminder.dueDateComponents = dueDateComponents
        reminder.calendar = self.eventStore.defaultCalendarForNewReminders()
        do {
            try self.eventStore.save(reminder, commit: true)
            //Why didn't the pop work?
//            self.navigationController?.popToRootViewController(animated: true)
            dismiss(animated: true, completion: nil)
        }catch{
            print("Error creating and saving new reminder : \(error)")
    }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        reminderTextField.text = reminder.title
        //datePicker = UIDatePicker()
        //datePicker.addTarget(self, action: "addDate", forControlEvents: UIControlEvents.ValueChanged)
        //datePicker.datePickerMode = UIDatePickerMode.DateAndTime
        //dateTextField.inputView = datePicker
        reminderTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
