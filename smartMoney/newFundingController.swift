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
    
    //피커뷰로 날짜 설정하기
    @IBOutlet weak var pickerView: UIDatePicker!
    @IBAction func datePick(_ sender: Any) {
        pickerView.addTarget(self, action: #selector(changed), for: .valueChanged)
        
    }
    
    @objc func changed(){
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy년 M월 d일"
        date = dateformatter.string(from: pickerView.date)
    }
    
    
    
    @IBOutlet weak var moreTF: UITextField!
    
    
    
    // 확인버튼 누르면 적은 내용 저장해서 fundingList 배열에 추가하기
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
    
    //적은 내용으로 Funding 인스턴스만들고 배열에 추가하는 함수
    // 일단은 더미 멤버로 만들어 놓음 2
    func saveData() {
        let info = Funding(name : fundingNameTF.text!, money :  moneyTF.text!, dueDate : date, more : moreTF.text!, yesMember: [], noMember : ["김철수", "박영희", "유재석", "박명수", "정준하", "개구리"])
        fundingList += [info]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"background")!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
