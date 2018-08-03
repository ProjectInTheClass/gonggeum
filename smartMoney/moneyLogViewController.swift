//
//  moneyLogViewController.swift
//  smartMoney
//
//  Created by cscoi052 on 2018. 7. 31..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

import UIKit
/*
struct Account{
    var bankName : String
    var accountNum : String
    var ownerName : String
    var balance : Int
    
}
 */

struct Info{
    var y: Int
    var m: Int
    var d: Int
    var eventName: String
    var money: Int
    var memo: String
    var inOut: Bool
    //evidence info? image? string?
}

class groupMoneyInfo{
   
    var infoList : [Info]
    
    init(){
        print("making infoList")
        infoList = []
        

    }
    
    func addInfo(newinfo : Info) {
        infoList.append(newinfo)
    }
    
    /*
     func deleteInfo(target: Info) -> Info {
     
     }
     */
    
    
}


class moneyLogViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var bankNameLabel: UILabel!
    @IBOutlet weak var accountNumlabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    
    @IBOutlet weak var moneyLogNav: UINavigationBar!///////need help
    
    var data : String?
    
   
    let group1 = groupMoneyInfo()
    var log  = Info(y : 2018, m : 1, d : 1, eventName : "MT", money : 10000, memo : "5명 참석", inOut : true)
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return group1.infoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moneyLogCell", for: indexPath) as! moneyLogTableViewCell
        
        let when : String = "1"
        let why : String = "hi"
        let balance: Int = 1
        
        cell.when.text = when
        cell.why.text = why
        cell.balance.text = "0"
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let accountInfoPath = Bundle.main.path(forResource: "AccountInfo", ofType: "plist"), let accountInfo = NSDictionary(contentsOfFile: accountInfoPath)
            {
                if let bankName : String = accountInfo["bankName"] as? String{
                    bankNameLabel.text = bankName
                }
                if let accountNum : String = accountInfo["accountNum"] as? String{
                    accountNumlabel.text = accountNum
                }
                if let owner : String = accountInfo["owner"] as? String{
                    ownerLabel.text = owner
                }
                if let balance : Int = accountInfo["balance"] as? Int{
                    balanceLabel.text = "\(balance)"
                }
            }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
