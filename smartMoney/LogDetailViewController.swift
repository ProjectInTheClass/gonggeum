//
//  LogDetailViewController.swift
//  smartMoney
//
//  Created by cscoi050 on 2018. 8. 10..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

import UIKit

class LogDetailViewController: UIViewController {
    
    var indexForLogs : Int?

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var howMuchLabel: UILabel!
    @IBOutlet weak var balanceThenLabel: UILabel!
    @IBOutlet weak var memoLabel: UILabel!
    
    @IBAction func DetailLogCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
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
