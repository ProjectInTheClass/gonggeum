//
//  fundingInfoController.swift
//  smartMoney
//
//  Created by cscoi055 on 2018. 8. 1..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

import UIKit

class fundingInfoController: UIViewController, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
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
            
            
        }
        else {
            print("미제출자 명단 선택")
        }
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
       fundingName.title = getFunding?.name
        moneyLabel.text = getFunding?.money
        duedayLabel.text = getFunding?.dueDate
        moreLabel.text = getFunding?.more
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
