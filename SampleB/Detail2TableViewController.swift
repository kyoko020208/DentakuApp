//
//  DetailTableViewController.swift
//  SampleB
//
//  Created by Kyoko Otsuka on 2017/01/08.
//  Copyright © 2017年 Kyoko Otsuka. All rights reserved.
//

import UIKit

class Detail2TableViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet weak var editMoneyTextField: UILabel!
    
    let pickerView = UIPickerView()

    let SaValues = ["0円", "100円", "500円", "1000円", "2000円", "5000円"]
    
    var index:Int?
    
    var moneyArray:[String]!
    
    var editedMoney:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editMoneyTextField.text = moneyArray[index!]
        
        _setPcker()
            }
    
    func _setPcker() {
        pickerView.delegate = self
        pickerView.dataSource = self
        
        pickerView.selectRow(6, inComponent: 0, animated: false)
//        editMoneyTextField.inputView = pickerView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return SaValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return SaValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var row1: NSInteger = pickerView.selectedRow(inComponent: 0)
        
        editMoneyTextField.text = String("\(SaValues[row1])")

    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        editedMoneyTextField.
//        
//    }
//    
//    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        _ = self.pickerView(pickerView, titleForRow: pickerView.selectedRow(inComponent: 0), forComponent: 0)
//        return editedMoney
//    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save2" {
            editedMoney = editMoneyTextField.text
            
        }
        
        
    }
    
}
