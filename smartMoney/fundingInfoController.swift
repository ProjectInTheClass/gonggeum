//
//  fundingInfoController.swift
//  smartMoney
//
//  Created by cscoi055 on 2018. 8. 1..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

import UIKit

class fundingInfoController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var yesView: UITableView!
    @IBOutlet weak var noView: UITableView!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView == yesView) {
            return (getFunding?.yesMember.count)!
        }
        else if (tableView == noView) {
            return (getFunding?.noMember.count)!
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        if (tableView == yesView) {
            cell.textLabel?.text = getFunding?.yesMember[indexPath.row]
        }
        else if (tableView == noView) {
            cell.textLabel?.text = getFunding?.noMember[indexPath.row]
        }
        cell.backgroundColor = .clear
        return cell
    }
    
    
    
    var getFunding : Funding?
    
    
    
    @IBOutlet weak var yesNoSegment: UISegmentedControl!
    @IBOutlet weak var fundingName: UINavigationItem!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var duedayLabel: UILabel!
    @IBOutlet weak var moreLabel: UILabel!
    
    @IBAction func changeContent(_ sender: Any) {
        if yesNoSegment.selectedSegmentIndex == 0{
            print("제출자 명단 선택")
            self.yesView.reloadData()
            view.bringSubview(toFront: yesView)
            
            
        }
        else {
            print("미제출자 명단 선택")
            self.noView.reloadData()
            view.bringSubview(toFront: noView)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"background")!)
        
        fundingName.title = getFunding?.name
        
        moneyLabel.text = getFunding?.money
        duedayLabel.text = getFunding?.dueDate
        moreLabel.text = getFunding?.more
    }
    
    
    @objc func logPressCalled(_ longPress : UILongPressGestureRecognizer) {
        print("longPressCalled")
        // long press 한 셀의 indexPath 구하기
        let locationInView = longPress.location(in : noView)
        let indexPath = noView.indexPathForRow(at: locationInView)
        print(indexPath!)
        
        //길게 누르면 alert 표시하기
        let dialog = UIAlertController(title : "삭제", message: "해당 인물을 제출자로 이동시키겠습니까?", preferredStyle : .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default){ _ in
            let deleted = self.getFunding?.noMember.remove(at: (indexPath?.row)!)
            self.noView.deleteRows(at: [indexPath!], with: UITableViewRowAnimation.automatic)
            self.getFunding?.yesMember.append(deleted!)
            //self.yesView.insertRows(at: [indexPath!], with: UITableViewRowAnimation.automatic)
            
        }
        dialog.addAction(okAction)
        
        let noAction = UIAlertAction(title: "취소", style: .destructive, handler : nil)
        dialog.addAction(noAction)
        self.present(dialog, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(logPressCalled(_:)))
        noView.addGestureRecognizer(longPressGesture)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
