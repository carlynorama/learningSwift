//
//  newReminder.swift
//  basicEventKit
//
//  Created by carlynorama on 9/11/16.
//  No rights reserved.
//

import UIKit
import EventKit

class NewReminder: UIViewController {

    @IBOutlet var reminderTextField: UITextField!
    var eventStore: EKEventStore!
    
    @IBAction func saveButtonAction(_ sender: AnyObject) {
        guard !((reminderTextField.text?.isEmpty)!) else {
            print("Nothing to send")
            return
        }
        
        let reminder = EKReminder(eventStore: eventStore)
        reminder.title = reminderTextField.text!
        //For Adding Date Later
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //let dueDateComponents = appDelegate.dateComponentFromNSDate(self.datePicker.date)
        //reminder.dueDateComponents = dueDateComponents
        reminder.calendar = self.eventStore.defaultCalendarForNewReminders()
        // 2
        do {
            try self.eventStore.save(reminder, commit: true)
            dismiss(animated: true, completion: nil)
        }catch{
            print("Error creating and saving new reminder : \(error)")
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("made it!")

        // Do any additional setup after loading the view.
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
