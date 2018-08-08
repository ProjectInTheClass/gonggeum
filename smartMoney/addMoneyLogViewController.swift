//
//  addMoneyLogViewController.swift
//  smartMoney
//
//  Created by cscoi052 on 2018. 7. 31..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

import UIKit

class addMoneyLogViewController: UIViewController {

    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var howMuch: UITextField!
    @IBOutlet weak var memo: UITextField!
    @IBOutlet weak var evidenceImage: UIImageView!
    
    
    
    @IBAction func cancelAdding(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveNewLog(_ sender: Any) {
        let encoder = JSONEncoder()
        
        
        
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
