//
//  TimeViewController.swift
//  Sho Remind
//
//  Created by Jesse St. John on 12/25/16.
//  Copyright © 2016 JNJ Apps. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TimeViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var reminderName: UILabel!
    @IBOutlet weak var reminderDiscription: UITextField!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var tableView: UITableView!
    
    var textEntered:[String] = []
    var timeAsString:[String] = []
    
    var textData = [String]()
    var timeData = [String]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timePicker.backgroundColor = UIColor.white
        timePicker.layer.cornerRadius = 10
        view.backgroundColor = UIColor.clear

        reminderDiscription.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
        tableView.isOpaque = true
        tableView.allowsSelection = false
        reminderDiscription.returnKeyType = UIReturnKeyType.done
        self.hideKeyboardWhenTappedAround()
        self.dismissKeyboard()
        
        if textData.isEmpty == true && timeData.isEmpty == true {
            textEntered = defaults.object(forKey: "textData") as? [String] ?? [String]()
            timeAsString = defaults.object(forKey: "timeData") as? [String] ?? [String]()
        }
        else {}
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if reminderDiscription.text?.isEmpty == true {
            let alert = UIAlertController(title: "Alert", message: "You cannot save this reminder without a discription", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK, Got it!", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            self.view.endEditing(true)
            textEntered.append(reminderDiscription.text!)
            textData.append(reminderDiscription.text!)
            reminderDiscription.text?.removeAll()
            
            let dateOnPicker = timePicker.date //capture the date shown on the picker
            let dateFormatter = DateFormatter() //create a date formatter
            
            dateFormatter.dateStyle = DateFormatter.Style.short
            dateFormatter.timeStyle = DateFormatter.Style.short
            
            let timeString = dateFormatter.string(from: dateOnPicker)
            
            timeAsString.append(timeString) //ex. prints 3:04 AM as "3:04 AM" and 11:37 PM as "11:37 PM"
            timeData.append(timeString)
            defaults.set(textData, forKey: "textData")
            defaults.set(timeData, forKey: "timeData")
            tableView.reloadData()
        }
        return false
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Saved Reminders"
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textEntered.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TimeTableViewCell
        let row = indexPath.row
        cell.myLabel_1.text = textEntered[row]
        cell.myLabel_2.text = timeAsString[row]
        cell.backgroundColor = UIColor.white
        cell.layer.borderWidth = 5
        cell.layer.cornerRadius = 15
        cell.layer.borderColor = UIColor.black.cgColor
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            textEntered.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
