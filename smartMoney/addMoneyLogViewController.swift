//
//  addMoneyLogViewController.swift
//  smartMoney
//
//  Created by cscoi052 on 2018. 7. 31..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

import UIKit


struct MoneyLog: Codable{
    var y: Int
    var m: Int
    var d: Int
    var eventName: String
    var money: Int
    var memo: String
    var InOut: Int
    //evidence info? image? string?
}

class addMoneyLogViewController: UIViewController {

    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var howMuch: UITextField!
    @IBOutlet weak var memo: UITextField!
    @IBOutlet weak var evidenceImage: UIImageView!
    @IBOutlet weak var InOut: UISegmentedControl!
    
    
    
    @IBAction func cancelAdding(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveNewLog(_ sender: Any) {
        let filePath = NSHomeDirectory() + "/Documents/moneyLog.json"
        let fileUrl = URL(fileURLWithPath: filePath)
        let encoder = JSONEncoder()
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let year: Int = Int(dateFormatter.string(from: self.date.date))!
        dateFormatter.dateFormat = "MM"
        let month: Int = Int(dateFormatter.string(from: self.date.date))!
        dateFormatter.dateFormat = "dd"
        let day: Int = Int(dateFormatter.string(from: self.date.date))!
        
        //checking in or out
        var IsIn: Int = 0
        if InOut.selectedSegmentIndex == 0{
            IsIn = 1
        }
        else if InOut.selectedSegmentIndex == 1{
            IsIn = -1
        }
       
        
        if let en = eventName.text, let hm = howMuch.text, let mm = memo.text{
        let log = MoneyLog(y: year, m: month, d: day, eventName: en, money: hm, memo: mm, InOut: IsIn)
        }
        
        if let data = try? encoder.encode(log) {
            try! data.write(to: fileUrl)
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
