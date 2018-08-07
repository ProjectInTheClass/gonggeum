//
//  newFundingController.swift
//  smartMoney
//
//  Created by cscoi055 on 2018. 8. 1..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

import UIKit

struct Funding : Codable{
    var name : String
    var money : String
    var dueDate : String
    var more : String
    var yesMember : [String]
    var noMember : [String]
    
}


class newFundingController: UIViewController {
    var date : String = ""
    
    @IBOutlet weak var fundingNameTF: UITextField!
    @IBOutlet weak var moneyTF: UITextField!
    
    @IBOutlet weak var pickerView: UIDatePicker!
    @IBAction func datePick(_ sender: Any) {
        pickerView.addTarget(self, action: #selector(changed), for: .valueChanged)
    
    }
    
    @objc func changed(){
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .medium
        dateformatter.timeStyle = .short
        date = dateformatter.string(from: pickerView.date)
    }
    
   
    
    @IBOutlet weak var moreTF: UITextField!
    

    
    @IBAction func saveButton(_ sender: Any) {
        if fundingNameTF.text != "" , moneyTF.text != "" {
            
            saveData()
            
            self.dismiss(animated : true, completion : nil)
        }else{
            let dialog = UIAlertController(title: "경고", message : "행사명과 금액을 모두 제대로 작성하세요", preferredStyle : .alert)
            
            let okAction  = UIAlertAction(title : "확인", style: .cancel, handler : nil)
            dialog.addAction(okAction)
            self.present(dialog, animated: true, completion: nil)
        }
        
    }
    
    func saveData() {
        let info = Funding(name : fundingNameTF.text!, money :  moneyTF.text!, dueDate : date, more : moreTF.text!, yesMember: [], noMember: [])
        fundingList += [info]
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
