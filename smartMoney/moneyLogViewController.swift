//
//  moneyLogViewController.swift
//  smartMoney
//
//  Created by cscoi052 on 2018. 7. 31..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

import UIKit

struct Account{
    var bankName : String
    var accountNum : String
    var ownerName : String
    var balance : Int
    
}
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
    var account : Account
    var infoList : [Info]
    
    init(){
        print("making infoList")
        infoList = []
        account = Account(bankName : "ㅇㅇ은행", accountNum : "111-111-1111", ownerName : "김미정", balance : 0)

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        group1.infoList.append(log)
        group1.infoList.append(log)
        group1.infoList.append(log)
        
        // Do any additional setup after loading the view.
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
