//
//  FirstViewController.swift
//  SampleB
//
//  Created by Kyoko Otsuka on 2016/12/28.
//  Copyright © 2016年 Kyoko Otsuka. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    //グループ1ゾーン
    
    var Ninzu1: Int = 0
    
    @IBOutlet weak var GroupOneNunzu: UITextField!

    
    
    @IBOutlet weak var GroupOneKingaku: UITextField!
    
    
    @IBAction func NinzuPlus(_ sender: UIButton) {
        Ninzu1 = Ninzu1 + 1
        GroupOneNunzu.text = String(Ninzu1)
    }
    
    
    @IBAction func NinzuMinus(_ sender: UIButton) {
        Ninzu1 = Ninzu1 - 1
        GroupOneNunzu.text = String(Ninzu1)
    }

    @IBAction func KingakuPlus(_ sender: UIButton) {
    }
    
    @IBAction func KingakuMinus(_ sender: UIButton) {
    }
    
    
    
    
    //合計ゾーン
    @IBOutlet weak var GokeiNinzu: UITextField!
    
    @IBOutlet weak var SyukeiKingaku: UITextField!
    
    @IBOutlet weak var KaikeiKingaku: UITextField!
    
    @IBOutlet weak var Sagaku: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

