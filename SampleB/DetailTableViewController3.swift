//
//  DetailTableViewController3.swift
//  SampleB
//
//  Created by Kyoko Otsuka on 2017/01/06.
//  Copyright © 2017年 Kyoko Otsuka. All rights reserved.
//

import UIKit

class DetailTableViewController3: UITableViewController {

    @IBOutlet weak var EditGroupTextField: UITextField!
    
    
    @IBOutlet weak var EditNumberTextField: UITextField!
    
    var index: Int?
    
    var groupArray:[String]!
    
    var numberArray:[String]!
    
    var editedGroup:String?
    
    var editedNumber:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EditGroupTextField.text = groupArray[index!]
        
        EditNumberTextField.text = numberArray[index!]
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            EditGroupTextField.becomeFirstResponder()
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save" {
            editedGroup = EditGroupTextField.text
            
            //            editedNumber = editNumberTextField.text
        }
        
    }
    
    
}
