//
//  DetailTableViewController.swift
//  SampleB
//
//  Created by Kyoko Otsuka on 2017/01/08.
//  Copyright © 2017年 Kyoko Otsuka. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    //人数の数値格納用
    var numberValue: Int = 0
    
    //グループ名称編集用の箱
    @IBOutlet weak var editModelTextField: UITextField!
    
    //グループにんずう編集用の箱
    @IBOutlet weak var editNumberTextField: UILabel!
    
    @IBOutlet weak var uiStepper: UIStepper!
    
    var index:Int?
    
    var modelArray:[String]!
    
    var numberArray:[Int]!
    
    var editedModel:String?
    
    var editedNumber:Int?
    
    //stepperで人数を加減
    @IBAction func uiChangeStepper(_ sender: UIStepper) {
        numberValue = Int(sender.value)
        editNumberTextField.text = String(Int(sender.value)) + "人"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //まずMainTableViewControllerからの値を設置
        editModelTextField.text = modelArray[index!]
        
        editNumberTextField.text = String(numberArray[index!]) + "人"
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
            editNumberTextField.becomeFirstResponder()
            print("2")
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MainTabelViewCOntrollerに値を引き継ぐ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save" {
            editedModel = editModelTextField.text
            
            editedNumber = numberValue
        }
        
        
    }
    
}
