//
//  DetailTableViewController.swift
//  SampleB
//
//  Created by Kyoko Otsuka on 2017/01/08.
//  Copyright © 2017年 Kyoko Otsuka. All rights reserved.
//

import UIKit

class Detail2TableViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    //金額編集用
    @IBOutlet weak var editMoneyTextField: UILabel!
    
    let pickerView = UIPickerView()

    //差金額格納用
    let SaValues = [0, 100, 500, 1000, 2000, 5000]
    
    //単位付きでpickerには表示
    var SaText: String = ""
    
    var SaText2: String = ""
    
    var Sa: Int = 500
    
    var index:Int?
    
    var moneyArray:[Int]!
    
    var editedMoney:Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初期値をセット
        SaText = String(moneyArray[index!]) + "円"
        
        editMoneyTextField.text = SaText
        
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
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        
        return String(SaValues[row]) + "円"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var row1: NSInteger = pickerView.selectedRow(inComponent: 0)
        
        SaText2 = String(SaValues[row1]) + "円"
        print(SaText2)
        
        editMoneyTextField.text = SaText2
        
        Sa = SaValues[row1]

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save2" {
            editedMoney = Sa
            
        }
        
        
    }
    
}
