//
//  GroupListEditController.swift
//  smartMoney
//
//  Created by cscoi051 on 2018. 8. 1..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

// 구성원 미구현

import UIKit

class GroupListEditController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var cellcount : Int = 1
    
    @IBOutlet weak var groupName: UITextField!
    @IBOutlet weak var groupTable: UITableView!
    @IBAction func addMembers(_ sender: Any) {
        cellcount += 1
        groupTable.reloadData()
    }
    
    var memberData : [String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellcount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memberCell", for: indexPath)
        
        return cell
    }
    
    var addInfo: ((Group) -> Void)?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.groupName.becomeFirstResponder()
    }
    
    // 취소 모달(Alertview) 관련 시작
    @IBAction func cancel(_ sender: Any) {
        
        self.groupName.resignFirstResponder()
        
        if self.groupName.text?.isEmpty == true
        {
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
//    @IBAction func save(_ sender: Any) {
//
//        // custom cell,
//        for i in 0..<cellcount{
//            let indexPath = IndexPath(row: i, section: 0)
//            let cell = groupTable.cellForRow(at: indexPath) as? memberCellTableViewCell
//            cell?.groupMemberAdd.text
//            memberData.append((cell?.groupMemberAdd.text)!)
//        }
//
//        self.groupName.resignFirstResponder()
//
//        if self.groupName.text?.isEmpty == true
//        {
//            self.dismiss(animated: true, completion: nil)
//            return
//        }
//
//        // 저장 관련 주의! 미구현
//        //        let yesActionsave = UIAlertAction(title: "NO", style: .destructive) { _ in
//        //            self.dismiss(animated: true, completion: nil)
//        //        }
//        //        let noActionsave = UIAlertAction(title: "YES", style: .default) { _ in
//        //            self.groupName.becomeFirstResponder()
//        //        }
//        //
//        //        let alertController = UIAlertController(
//        //            title: "확인!",
//        //            message: "현재 내용을 저장하시겠습니까?",
//        //            preferredStyle: .alert
//        //        )
//        //
//        //        alertController.addAction(yesAction)
//        //        alertController.addAction(noAction)
//        //        self.present(alertController, animated: true, completion: nil)
//
//        let newGroup = Group(title: groupName.text!)
//        newGroup.members = memberData
//        self.addInfo?(newGroup)
//        print(newGroup.title)
//        print(newGroup.members)
//
//        self.dismiss(animated: true, completion: nil)
//    }
//    // 저장 관련 끝
    
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

