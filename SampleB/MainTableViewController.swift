//
//  MainTableViewController.swift
//  SampleB
//
//  Created by Kyoko Otsuka on 2017/01/08.
//  Copyright © 2017年 Kyoko Otsuka. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    
    var models = ["グループ1", "グループ2", "グループ3","グループ4","グループ5"]
    
    var numbers = ["0人", "0人", "0人", "0人", "0人",]
    
    @IBAction func saveToMainViewController (segue: UIStoryboardSegue) {
        
        let detailViewController = segue.source as! DetailTableViewController
        
        let index = detailViewController.index
        
        let modelString = detailViewController.editedModel
        
        let numberString = detailViewController.editedNumber
        
        models[index!] = modelString!
        
        numbers[index!] = numberString!
        
        tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        cell.textLabel?.text = models[indexPath.row]
        
        cell.detailTextLabel?.text = numbers[indexPath.row]
        
        tableView.tableFooterView = UIView()
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Edit" {
            var path = tableView.indexPathForSelectedRow
            
            var detailViewController = segue.destination as! DetailTableViewController
            
            detailViewController.index = path?.row
            detailViewController.modelArray = models
            detailViewController.numberArray = numbers
            
            let navBar = UINavigationBar()
            navBar.frame = CGRect(x: 0, y: 0, width: 320, height: 60)
            
            let navItem: UINavigationItem = UINavigationItem(title: "aaa")
            navItem.leftBarButtonItem = UIBarButtonItem(title: "保存", style: UIBarButtonItemStyle.plain, target: self, action: "action:")
            
            navBar.pushItem(navItem, animated: true)
            
            segue.destination.view.addSubview(navBar)
        }
        
        
    }
 
    
    
    
    
    
}
