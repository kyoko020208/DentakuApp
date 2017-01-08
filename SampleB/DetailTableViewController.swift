//
//  DetailTableViewController.swift
//  SampleB
//
//  Created by Kyoko Otsuka on 2017/01/08.
//  Copyright © 2017年 Kyoko Otsuka. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    
    @IBOutlet weak var editModelTextField: UITextField!
    
    @IBOutlet weak var ditNumberTextField: UITextField!
    
    
    var index:Int?
    
    var modelArray:[String]!
    
    var numberArray:[String]!
    
    var editedModel:String?
    
    var editedNumber:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editModelTextField.text = modelArray[index!]
        
        ditNumberTextField.text = numberArray[index!]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 && indexPath.row == 0 {
            editModelTextField.becomeFirstResponder()
            print("1")
        } else if indexPath.section == 1 && indexPath.row == 0 {
            ditNumberTextField.becomeFirstResponder()
            print("2")
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save" {
            editedModel = editModelTextField.text
            
            editedNumber = ditNumberTextField.text
        }
        
        
    }
    
}
