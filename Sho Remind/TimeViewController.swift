//
//  TimeViewController.swift
//  Sho Remind
//
//  Created by Jesse St. John on 12/25/16.
//  Copyright © 2016 JNJ Apps. All rights reserved.
//

import Foundation
import UIKit

class TimeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var reminderName: UILabel!
    @IBOutlet weak var reminderDiscription: UITextField!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var staticLable: UILabel!
    @IBOutlet weak var dynamicLable: UILabel!
    
    var textEntered = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reminderDiscription.delegate = self
        staticLable.isHidden = true
 
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        staticLable.isHidden = false 
        textEntered = reminderDiscription.text!
        dynamicLable.text = textEntered
        print(textEntered)
        return false
        
    }

}
