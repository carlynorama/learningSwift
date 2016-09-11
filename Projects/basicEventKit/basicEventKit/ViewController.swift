//
//  ViewController.swift
//  basicEventKit
//
//  Created by carlynorama on 9/9/16.
//  No rights reserved.
// http://sweettutos.com/2015/11/25/eventkit-reminders-manager-how-to-retrieve-create-and-edit-reminders-from-within-your-app-in-swift/

import UIKit
import EventKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var myRemindersTable: UITableView!
    var eventStore: EKEventStore!
    var reminders: [EKReminder]!  //add "Privacy - Reminders Usage Description" to info.plist
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table View
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(reminders.count)
        return reminders.count
        
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "reminderCell")
        let reminder:EKReminder! = reminders![indexPath.row]
        cell.textLabel?.text = reminder.title
        let formatter:DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let dueDate = reminder.dueDateComponents?.date{
            cell.detailTextLabel?.text = formatter.string(from: dueDate)
        }else{
            cell.detailTextLabel?.text = "N/A"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let reminder: EKReminder = reminders[indexPath.row]
        do{
            try eventStore.remove(reminder, commit: true)
            self.reminders.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.fade)
        }catch{
            print("An error occurred while removing the reminder from the database: \(error)")
        }
    }
    
    // MARK: - Event Kit Handling
    
    override func viewWillAppear(_ animated: Bool) {
        self.eventStore = EKEventStore()
        self.reminders = [EKReminder]()
        //completion handlers {() in }
        self.eventStore.requestAccess(to: EKEntityType.reminder) { (accessGranted, error: Error?) in
            if accessGranted {
                let predicate = self.eventStore.predicateForReminders(in: nil)
                self.eventStore.fetchReminders(matching: predicate, completion: { (reminders: [EKReminder]?) -> Void in
                    self.reminders = reminders
                    DispatchQueue.main.async() {
                        self.myRemindersTable.reloadData()
                    }
                })
            } else {
                self.rejected()
            }
        }
    }

    
    public func rejected() {
        print("The app is not permitted to access reminders, make sure to grant permission in the settings and try again")
    }
    



}

