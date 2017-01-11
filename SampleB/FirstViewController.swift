//
//  FirstViewController.swift
//  SampleB
//
//  Created by Kyoko Otsuka on 2016/12/28.
//  Copyright © 2016年 Kyoko Otsuka. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    var CurrentSagaku: Int = 500
    
    var sumKin: String = ""
    
    var Ninzu:[Int] = [0, 0, 0, 0, 0]
    
    var Kingaku:[Int] = [0, 0, 0, 0, 0]
    
    var sumKingakuByGroup:[Int] = [0, 0, 0, 0, 0]
    
    var i: Int = 1
    
    var sumKingaku: Int = 0
    
    var Sa: Int = 0
    
    var index: Int?
    
    var models:[String]!
    
    var numbers:[String]!
    
    
    //各グループの人数・金額表示
    @IBOutlet weak var GroupOneNunzu: UILabel!
    
    @IBOutlet weak var GroupOneKingaku: UILabel!
    
    @IBOutlet weak var GroupTwoNinzu: UILabel!
    
    @IBOutlet weak var GroupTwoKingaku: UILabel!
    
    @IBOutlet weak var GroupThreeNinzu: UILabel!
    
    @IBOutlet weak var GroupThreeKingaku: UILabel!
    
    @IBOutlet weak var GroupFourNinzu: UILabel!
    
    
    @IBOutlet weak var GroupFourKingaku: UILabel!
    
    
    @IBOutlet weak var GroupFiveNinzu: UILabel!
    
    @IBOutlet weak var GroupFiveKingaku: UILabel!
    
    
    //合計金額など
    @IBOutlet weak var SyukeiKingaku: UILabel!
    
    @IBOutlet weak var Sagaku: UILabel!
    
    @IBOutlet weak var GokeiNinzu: UILabel!
    
    @IBOutlet weak var GokeiKingaku: UILabel!
    
    
    //グループ名
    
    @IBOutlet weak var GroupOneName: UILabel!
    
    @IBOutlet weak var GroupTwoName: UILabel!
    
    @IBOutlet weak var GroupThreeName: UILabel!
    
    @IBOutlet weak var GroupFourName: UILabel!
    
    @IBOutlet weak var GroupFiveName: UILabel!
    
    @IBAction func Reset(_ sender: UIButton) {
        for i in 0...4{
            Ninzu[i] = 0
            Kingaku[i] = 0
        }
    }
    
    //
    //    @IBAction func saveToMainViewController3 (segue: UIStoryboardSegue) {
    //
    //        let detailViewController = segue.source as! DetailTableViewController
    //
    //        let index = detailViewController.index
    //
    //        let modelString = detailViewController.editedModel
    //
    //        let numberString = detailViewController.editedNumber
    //
    //        models[index!] = modelString!
    //
    //        numbers[index!] = numberString!
    //
    //        GroupOneName.text = models[0]
    //
    //    }
    
    
    //人数加算
    @IBAction func NinzuPlus(_ sender: UIButton) {
        i = sender.tag - 1
        NinzuPlus()
        NinzuShow()
        KingakuShow()
    }
    
    //人数減算
    @IBAction func NinzuMinus(_ sender: UIButton) {
        i = sender.tag - 1
        NinzuMinus()
        NinzuShow()
        KingakuShow()
    }
    
    @IBAction func KingakuPlus(_ sender: UIButton) {
        i = sender.tag - 1
        KingakuPlus()
        KingakuShow()
    }
    
    @IBAction func KingakuMinus(_ sender: UIButton) {
        i = sender.tag - 1
        KingakuMinus()
        KingakuShow()
    }
    
    func NinzuPlus() {
        Ninzu[i] = Ninzu[i] + 1
    }
    
    func NinzuMinus() {
        if Ninzu[i] > 0 {
            Ninzu[i] = Ninzu[i] - 1
        } else {
            Ninzu[i] = Ninzu[i]
        }
    }
    
    func KingakuPlus() {
        Kingaku[i] = Kingaku[i] + CurrentSagaku
    }
    
    func KingakuMinus() {
        if Kingaku[i] > 0 {
            Kingaku[i] = Kingaku[i] - CurrentSagaku
        } else {
            Kingaku[i] = Kingaku[i]
        }
    }
    
    
    
    @IBAction func back(segue: UIStoryboardSegue) {
        GokeiKingaku.text = sumKin
        SaKeisan()
    }
    

    
    
    
    func SaKeisan() {
        Sa = Int(GokeiKingaku.text!)! - sumKingaku
        Sagaku.text = String(Sa)
    }
    
    func KingakuShow() {
        switch i {
        case 0:
            GroupOneKingaku.text = String(Kingaku[i])
        case 1:
            GroupTwoKingaku.text = String(Kingaku[i])
        case 2:
            GroupThreeKingaku.text = String(Kingaku[i])
        case 3:
            GroupFourKingaku.text = String(Kingaku[i])
        case 4:
            GroupFiveKingaku.text = String(Kingaku[i])
        default:
            return
        }
        sumKingakuByGroup[i] = Ninzu[i] * Kingaku[i]
        sumKingaku = sumKingakuByGroup.reduce(0) {
            (num1, num2) -> Int in
            num1 + num2
        }
        SyukeiKingaku.text = String(sumKingaku)
        SaKeisan()
    }
    
    
    
    func NinzuShow() {
        switch i {
        case 0:
            GroupOneNunzu.text = String(Ninzu[i])
        case 1:
            GroupTwoNinzu.text = String(Ninzu[i])
        case 2:
            GroupThreeNinzu.text = String(Ninzu[i])
        case 3:
            GroupFourNinzu.text = String(Ninzu[i])
        case 4:
            GroupFiveNinzu.text = String(Ninzu[i])
        default:
            return
        }
        let sumNinzu = Ninzu.reduce(0) {
            (num1, num2) -> Int in
            num1 + num2
        }
        GokeiNinzu.text = String(sumNinzu)
        SyukeiKingaku.text = String(sumKingaku)
        //            String(sumKingaku)
        SaKeisan()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        GroupOneName.text = modelArray[0]
        //        GroupTwoName.text = modelArray[1]
        //        GroupThreeName.text = modelArray[2]
        //        GroupFourName.text = modelArray[3]
        //        GroupFiveName.text = modelArray[4]
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

