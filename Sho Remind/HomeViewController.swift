//
//  ViewController.swift
//  Sho Remind
//
//  Created by Jesse St. John on 12/24/16.
//  Copyright © 2016 JNJ Apps. All rights reserved.
//

import UIKit
import Foundation

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var way: UILabel!
    @IBOutlet weak var place: UIButton!
    @IBOutlet weak var time: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func timeAction(_ sender: Any) {
        performSegue(withIdentifier: "timeSegue", sender: self)
    }
    @IBAction func placeAction(_ sender: Any) {
        performSegue(withIdentifier: "placeSegue", sender: self)
    }
    
    let tableVeiwItems = ["3:00pm", "2:00pm", "1:00pm"]
    let sectionTwo = ["Home", "Work", "Mom & Dad's House"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor.green
        
        way.font = UIFont (name: "HelveticaNeue-Bold", size: 19)!
        way.textAlignment = .center
        
        place.layer.cornerRadius = 8
        place.backgroundColor = UIColor.green
        place.titleLabel?.font = UIFont (name: "HelveticaNeue-Bold", size: 18)!
        place.setTitle("Place", for: .normal)
        
        time.layer.cornerRadius = 8
        time.backgroundColor = UIColor.green
        time.titleLabel?.font = UIFont (name: "HelveticaNeue-Bold", size: 18)!
        time.setTitle("Time", for: .normal)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
        tableView.backgroundView?.isOpaque = true
        tableView.allowsSelection = false
        
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Next time reminder"
        }
        else {
            return "Next location reminder"
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableVeiwItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell")
            let row = indexPath.row
            cell?.textLabel?.text = tableVeiwItems[row]
            return cell!
        }
        else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell")
            let row = indexPath.row
            cell?.textLabel?.text = tableVeiwItems[row]
            return cell!
        }
        
    }
    func timeAction(sender: UIButton!){
        let btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            print("Button Pressed")
        }
        // performSegue(withIdentifier: "timeSegue", sender: self)
    }
    
    
}

