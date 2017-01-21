import UIKit

class MainTableViewController: UITableViewController {
    
    //グループ名称の初期値
    var models = ["部長", "課長", "主査","担当","遅れてきた人"]
    
    //グループ人数の初期値
    var numbers = [0, 0, 0, 0, 0]
    
    //＋ーを押した時の値のタイトル
    var moneytitle = ["グループ間差額"]
    
    //＋ーを押した時の値
    var money = [500]
    
    var moneyValue = 500
    
    //表のタイトル
    var titles = ["グループ設定", "差額設定"]
    
    //DetailTableViewCOntrollerからの値の引き継ぎ
    @IBAction func saveToMainViewController (segue: UIStoryboardSegue) {
        
        let detailViewController = segue.source as! DetailTableViewController
        
        let index = detailViewController.index
        
        let modelString = detailViewController.editedModel
        
        let numberString = detailViewController.editedNumber
        
        models[index!] = modelString!
        
        numbers[index!] = numberString!
        
        tableView.reloadData()
        
    }
    
    
    
    //DetailViewController2からの値の引き継ぎ
    @IBAction func saveToMainViewController2 (segue: UIStoryboardSegue) {
        
        let detailViewController2 = segue.source as! Detail2TableViewController
        
        let index = detailViewController2.index
        
        let moneyString = detailViewController2.editedMoney
        
        money[index!] = moneyString!
        
        tableView.reloadData()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    //セクション数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return models.count
        } else if section == 1 {
            return money.count
        } else {
            return 0
        }
    }
    
    //CEllデータ
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.tableFooterView = UIView()
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = models[indexPath.row]
            cell.detailTextLabel?.text = String(numbers[indexPath.row]) + "人"
        } else if indexPath.section == 1 {
            cell.textLabel?.text = moneytitle[indexPath.row]
            cell.detailTextLabel?.text = String(money[indexPath.row]) + "円"
        }
        return cell
    }
    
    //セクションタイトル
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    //Cellが押された時の画面遷移
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && (indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4 ) {
            performSegue(withIdentifier: "Edit", sender: nil)
            print("Edit")
        } else if indexPath.section == 1 && indexPath.row == 0 {
            performSegue(withIdentifier: "Edit2", sender: nil)
            print("Edit2")
        }
        
    }
    
    //DetailViewController/DetailViewCOntroller2にセルの値を引き継ぐ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Edit"{
            var path = tableView.indexPathForSelectedRow
            
            var detailViewController = segue.destination as! DetailTableViewController
            
            detailViewController.index = path?.row
            detailViewController.modelArray = models
            detailViewController.numberArray = numbers
            
        } else if segue.identifier == "Edit2" {
            
            var path2 = tableView.indexPathForSelectedRow
            
            var detailViewController2 = segue.destination as! Detail2TableViewController
            
            detailViewController2.index = path2?.row
            detailViewController2.moneyArray = money
        } else if segue.identifier == "save3" {
            moneyValue = money[0]
            
        }
    }
    
}
