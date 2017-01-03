//
//  ViewController.swift
//  sampleC
//
//  Created by Kyoko Otsuka on 2016/12/31.
//  Copyright © 2016年 Kyoko Otsuka. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedText: String?
    
    var groups = ["グループ1", "グループ2", "グループ3", "グループ4", "グループ5"]
    
    var people = ["0人", "0人", "0人", "0人", "0人", "0人"]
    
    @IBAction func saveToMainViewController(segue:UIStoryboardSegue) {
        
        let detailViewController = segue.source as! DetailTableViewController
        
        let index = detailViewController.index
        
        let nameString = detailViewController.editedName
        
        groups[index!] = nameString!
        
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
    
    
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "tableCell", for : indexPath)
        
        cell.textLabel?.text = groups[indexPath.row]
        
        cell.detailTextLabel?.text = people[indexPath.row]
        
        tableView?.tableFooterView = UIView()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedText = groups[indexPath.row]
        
        performSegue(withIdentifier: "showEditView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showEditView") {
            let EditVC: DetailTableViewController = (segue.destination as? DetailTableViewController)!
            
            EditVC.text = selectedText
        }
    }
    
    
    
    
}
