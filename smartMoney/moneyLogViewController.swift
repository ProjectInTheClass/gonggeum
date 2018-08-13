//
//  moneyLogViewController.swift
//  smartMoney
//
//  Created by cscoi052 on 2018. 7. 31..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

import UIKit


class moneyLogViewController: UIViewController, UITableViewDataSource {
    //공금계좌 정보 라벨
    
    @IBOutlet weak var GroupNameLabel: UILabel!
    @IBOutlet weak var bankNameLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var accountNumLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    
    
    //앞선 단계에서 보내온 데이터를 받기 위함.
    var data : String?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return currentGroupLogs.count
   
    }
    
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moneyLogCell", for: indexPath) as! moneyLogTableViewCell
        
        let logForCell = currentGroupLogs[(currentGroupLogs.count-1) - indexPath.row]
        let when : String = "\(logForCell.y)" + "." +
                            "\(logForCell.m)" + "." +
                            "\(logForCell.d)"
        let why : String = logForCell.eventName
        let InOutMoney : Int = logForCell.money * logForCell.InOut
        
        cell.when.text = when
        cell.why.text = why
        cell.balance.text = "\(InOutMoney)"
        
        //make background clear
        cell.layer.backgroundColor = UIColor.clear.cgColor
        
        return cell
    }

    override func viewWillAppear(_ animated: Bool) {
        GroupNameLabel.text = currentGroup
        if let ACinfo = accountInfo{

                if let bankName : String = ACinfo["bankName"] as? String{
                    bankNameLabel.text = bankName
                }

                if let accountNum : String = ACinfo["accountNum"] as? String{
                    accountNumLabel.text = accountNum
                }

                if let owner : String = ACinfo["owner"] as? String{
                    ownerLabel.text = owner
                }
                
                if let balance : Int = ACinfo["balance"] as? Int{
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
