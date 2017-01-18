//
//  FirstViewController.swift
//  SampleB
//
//  Created by Kyoko Otsuka on 2016/12/28.
//  Copyright © 2016年 Kyoko Otsuka. All rights reserved.
//

import UIKit
import Social

class FirstViewController: UIViewController, UIViewControllerTransitioningDelegate, UITabBarDelegate {
    
    var CurrentSagaku: Int = 500
    
    var sumKin: String = ""
    
    var Ninzu:[Int] = [0, 0, 0, 0, 0]
    
    var Kingaku:[Int] = [0, 0, 0, 0, 0]
    
    var sumKingakuByGroup:[Int] = [0, 0, 0, 0, 0]
    
    var groupNames:[String] = ["グループ1","グループ2","グループ3","グループ4","グループ5"]
    
    var i: Int = 0
    
    var sumKingaku: Int = 0
    
    var sumNinzu: Int = 0
    
    var Sa: Int = 0
    
    var index: Int?
    
    var models:[String]!
    
    var numbers:[String]!
    
    let imageLock:UIImage = UIImage(named:"iconmonstr-lock-13-72")!
    
    let imageUnlock:UIImage = UIImage(named: "iconmonstr-lock-23-24")!
    
    var clickCount:[Int] = [0, 0, 0, 0, 0]
    
    var Lock: [Bool] = [false, false, false, false, false, false]
    
    
    @IBOutlet weak var myTabBar: UITabBarItem!
    
    
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
    
    //ロックボタン
    
    @IBOutlet weak var lockBtnOne: UIButton!
    
    @IBOutlet weak var lockBtnTwo: UIButton!
    
    @IBOutlet weak var lockBtnThree: UIButton!
    
    @IBOutlet weak var ockBtnFour: UIButton!
    
    @IBOutlet weak var lockBtnFive: UIButton!
    
    //シェアボタン
    
    @IBAction func ShareBtn(_ sender: UIButton) {
        //共有する項目
        let shareText = "会計金額"
        let activityItems = [shareText]
        
        //初期化処理
        let activityVC = UIActivityViewController (activityItems: [shareText], applicationActivities: nil)
        
        //使用しないアクティビティタイプ
        //        let excudedActivityTypes = [UIActivityType.postToFacebook, UIActivityType.postToTwitter,UIActivityType.saveToCameraRoll]
        //
        //
        //        activityVC.excludedActivityTypes = excudedActivityTypes
        
        self.present(activityVC, animated:true, completion: nil)
    }
    
    //リセットボタン
    @IBAction func Reset(_ sender: UIButton) {
        for i in 0...4{
            print(i)
            Ninzu[i] = 0
            Kingaku[i] = 0
            GroupOneNunzu.text = "0"
            GroupTwoNinzu.text = "0"
            GroupThreeNinzu.text = "0"
            GroupFourNinzu.text = "0"
            GroupFiveNinzu.text = "0"
            GroupOneKingaku.text = "0"
            GroupTwoKingaku.text = "0"
            GroupThreeKingaku.text = "0"
            GroupFourKingaku.text = "0"
            GroupFiveKingaku.text = "0"
            SyukeiKingaku.text = "0"
            GokeiKingaku.text = "0"
            GokeiNinzu.text = "0"
            Sagaku.text = "0"
            sumKingaku = 0
            sumKin = "0"
            sumNinzu = 0
            sumKingakuByGroup[i] = 0
            
            print(Ninzu[i])
            print(Kingaku[i])
        }
    }
    
    
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
    
    //金額加算
    @IBAction func KingakuPlus(_ sender: UIButton) {
        i = sender.tag - 1
        KingakuPlus()
        KingakuShow()
    }
    
    //金額減算
    @IBAction func KingakuMinus(_ sender: UIButton) {
        i = sender.tag - 1
        KingakuMinus()
        KingakuShow()
    }
    
    //ロックボタン
    
    @IBAction func lockBtn(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            if clickCount[i]%2 == 0 {
                lockBtnOne.setImage(imageUnlock, for: UIControlState())
                Lock[i] = true
            } else {
                lockBtnOne.setImage(imageLock, for: UIControlState())
                Lock[i] = false
            }
            clickCount[i] = clickCount[i] + 1
        case 2:
            if clickCount[i]%2 == 0 {
                lockBtnTwo.setImage(imageUnlock, for: UIControlState())
                Lock[i] = true
            } else {
                lockBtnTwo.setImage(imageLock, for: UIControlState())
                Lock[i] = false
            }
            clickCount[i] = clickCount[i] + 1
        case 3:
            if clickCount[i]%2 == 0 {
                lockBtnThree.setImage(imageUnlock, for: UIControlState())
                Lock[i] = true
            } else {
                lockBtnThree.setImage(imageLock, for: UIControlState())
                Lock[i] = false
            }
            clickCount[i] = clickCount[i] + 1
        case 4:
            if clickCount[i]%2 == 0 {
                ockBtnFour.setImage(imageUnlock, for: UIControlState())
                Lock[i] = true
            } else {
                ockBtnFour.setImage(imageLock, for: UIControlState())
                Lock[i] = false
            }
            clickCount[i] = clickCount[i] + 1
        case 5:
            if clickCount[i]%2 == 0 {
                lockBtnFive.setImage(imageUnlock, for: UIControlState())
                Lock[i] = true
            } else {
                lockBtnFive.setImage(imageLock, for: UIControlState())
                Lock[i] = false
            }
            clickCount[i] = clickCount[i] + 1
        default:
            return
        }
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
        if Lock[i] == false {
            Kingaku[i] = Kingaku[i] + CurrentSagaku
        } else {
            Kingaku[i] = Kingaku[i]
        }
    }
    
    func KingakuMinus() {
        if Lock[i] == false && Kingaku[i] > 0 {
            Kingaku[i] = Kingaku[i] - CurrentSagaku
        } else {
            Kingaku[i] = Kingaku[i]
        }
    }
    
    func ImageSwitch() {
        
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
        sumNinzu = Ninzu.reduce(0) {
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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveToMainViewController3 (segue: UIStoryboardSegue) {
        
        let mainTableViewController = segue.source as! MainTableViewController
        
        groupNames = mainTableViewController.models
        
        Ninzu = mainTableViewController.numbers
        
        CurrentSagaku = mainTableViewController.moneyValue

        GroupOneName.text = groupNames[0]
        GroupTwoName.text = groupNames[1]
        GroupThreeName.text = groupNames[2]
        GroupFourName.text = groupNames[3]
        GroupFiveName.text = groupNames[4]
        
        GroupOneNunzu.text = String(Ninzu[0])
        GroupTwoNinzu.text = String(Ninzu[1])
        GroupThreeNinzu.text = String(Ninzu[2])
        GroupFourNinzu.text = String(Ninzu[3])
        GroupFiveNinzu.text = String(Ninzu[4])
    }
    
    
    
}

