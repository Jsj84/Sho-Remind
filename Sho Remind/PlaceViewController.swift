//
//  PlaceViewController.swift
//  Sho Remind
//
//  Created by Jesse St. John on 12/25/16.
//  Copyright © 2016 JNJ Apps. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class PlaceViewController: UIViewController {
    @IBOutlet weak var reminderLabel: UILabel!
    @IBOutlet weak var discriptionTextField: UITextField!
    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        self.navigationController?.hidesBarsOnTap = true
        self.navigationController?.hidesBarsWhenKeyboardAppears = true
    }
    
}
