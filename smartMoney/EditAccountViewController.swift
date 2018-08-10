//
//  EditAccountViewController.swift
//  smartMoney
//
//  Created by cscoi052 on 2018. 8. 3..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

import UIKit

class EditAccountViewController: UIViewController {

    @IBOutlet weak var bankName: UITextField!
    @IBOutlet weak var accountNum: UITextField!
    @IBOutlet weak var ownerName: UITextField!
    
    @IBAction func modalCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func modalSave(_ sender: Any) {
        ////////////////
        if let accountInfoPath = Bundle.main.path(forResource: "AccountInfo", ofType: "plist")
        {
            print(accountInfoPath)
          
            if let changedAccountInfo = NSMutableDictionary(contentsOfFile: accountInfoPath){
            
                changedAccountInfo["bankName"] = bankName.text
                changedAccountInfo["accountNum"] = accountNum.text
                changedAccountInfo["owner"] = ownerName.text
                
                //put edited data into AccountInfo.plist
                do {
                    try changedAccountInfo.write(to: NSURL.fileURL(withPath: accountInfoPath))
                    
                }
                catch{
                    print("ERROR in writing changed accountInfo")
                }
            }
            
            
    
        }
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
