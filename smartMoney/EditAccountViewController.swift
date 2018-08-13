//
//  EditAccountViewController.swift
//  smartMoney
//
//  Created by cscoi052 on 2018. 8. 3..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

import UIKit

class EditAccountViewController: UIViewController {

    @IBOutlet weak var bankNameField: UITextField!
    @IBOutlet weak var accountNumField: UITextField!
    @IBOutlet weak var ownerField: UITextField!
    
    
    @IBAction func modalCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func modalSave(_ sender: Any) {
        
        if AccountInfo == nil, currentGroup != nil{
            AccountInfo[currentGroup!] = accountInfo(accountNum: "계좌번호를 등록해주세요", owner: "사용자를 등록해주세요", bankName: "은행을 등록해주세요", balance: 0)
        }
        
        if AccountInfo != nil, currentGroup != nil {
            var info = AccountInfo[currentGroup!]!
            
            if let bankChanged = bankNameField.text{
                info.bankName = bankChanged
            }
            if let accountChanged = accountNumField.text{
                info.accountNum = accountChanged
            }
            if let ownerChanged = ownerField.text{
                info.owner = ownerChanged
            }
       
        }
        
        self.dismiss(animated: true, completion: nil)
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
