//
//  ViewController.swift
//  sampleC
//
//  Created by Kyoko Otsuka on 2016/12/31.
//  Copyright © 2016年 Kyoko Otsuka. All rights reserved.
//

import UIKit

class ThirdViewController: UITableViewController {
    
    var groups = ["グループ1", "グループ2", "グループ3", "グループ4", "グループ5"]
    
    var numbers = ["0人", "0人", "0人", "0人", "0人", "0人"]
    
    @IBAction func saveToMainViewController(segue:UIStoryboardSegue) {
        
        let detailViewController = segue.source as! DetailTableViewController3
        
        let index = detailViewController.index
        
        let groupString = detailViewController.editedGroup
        
        let numberString = detailViewController.editedGroup
        
        groups[index!] = groupString!
        
        numbers[index!] = numberString!
        
        tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for : indexPath)
        
        cell.textLabel?.text = groups[indexPath.row]
        
        cell.detailTextLabel?.text = numbers[indexPath.row]
        
        tableView.tableFooterView = UIView()
        
        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Edit" {
            
            var path = tableView.indexPathForSelectedRow
            
            let detailViewController = segue.destination as! DetailTableViewController3
         
            detailViewController.index = path?.row
            detailViewController.groupArray = groups
            detailViewController.numberArray = numbers
        }
    }
    
    
}
