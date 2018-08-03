//
//  GroupListEditController.swift
//  smartMoney
//
//  Created by cscoi051 on 2018. 8. 1..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

import UIKit

class GroupListEditController: UIViewController {

    @IBOutlet weak var groupName: UITextField!
    @IBOutlet weak var groupMember: UITextField!
    @IBOutlet weak var groupMember2: UITextField!
    @IBOutlet weak var groupMember3: UITextField!
    @IBOutlet weak var groupMember4: UITextField!
    
    var addInfo: ((Group) -> Void)?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.groupName.becomeFirstResponder()
    }
    
    // 취소 모달(Alertview) 관련 시작
    @IBAction func cancel(_ sender: Any) {
        self.groupName.resignFirstResponder()
        
        if self.groupName.text?.isEmpty == true {
        self.dismiss(animated: true, completion: nil)
        return
        }
        
        let yesAction = UIAlertAction(title: "YES", style: .destructive) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        let noAction = UIAlertAction(title: "NO", style: .default) { _ in
            self.groupName.becomeFirstResponder()
        }
        
        let alertController = UIAlertController(
            title: "주의!",
            message: "취소하면 작성중인 내용이 사라집니다.\n취소하시겠어요?",
            preferredStyle: .alert
        )
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        self.present(alertController, animated: true, completion: nil)
    }
    // 취소 모달(Alertview) 관련 끝

    // 저장 관련 시작
    @IBAction func save(_ sender: Any) {

        self.groupName.resignFirstResponder()
        
        let newGroup = Group(title: groupName.text!)
        self.addInfo?(newGroup)
        self.dismiss(animated: true, completion: nil)
    }
    // 저장 관련 끝
    
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
