//
//  moneyLogViewController.swift
//  smartMoney
//
//  Created by cscoi052 on 2018. 7. 31..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

import UIKit


class moneyLogViewController: UIViewController, UITableViewDataSource {
    
    var rowNum : Int = logs.count
    
    //앞선 단계에서 보내온 데이터를 받기 위함.
    var data : String?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return rowNum
   
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moneyLogCell", for: indexPath) as! moneyLogTableViewCell
        
        
        let when : String = "1"
        let why : String = "hi"
        let balance: Int = 1
        
        cell.when.text = when
        cell.why.text = why
        cell.balance.text = "\(balance)"
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        rowNum = logs.count
        
        if let accountInfoPath = Bundle.main.path(forResource: "AccountInfo", ofType: "plist"), let accountInfo = NSDictionary(contentsOfFile: accountInfoPath)
            {
                print(accountInfo)
//
//                if let bankName : String = accountInfo["bankName"] as? String{
//                    bankNameLabel.text = bankName
//                }
//
//                if let accountNum : String = accountInfo["accountNum"] as? String{
//                    accountNumlabel.text = accountNum
//                }
//
//                if let owner : String = accountInfo["owner"] as? String{
//                    ownerLabel.text = owner
//                }
                
                //if let balance : Int = accountInfo["balance"] as? Int{
                //    balanceLabel.text = "\(balance)"
                //}
 
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
