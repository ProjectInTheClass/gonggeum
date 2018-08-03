//
//  searchGroupViewController.swift
//  smartMoney
//
//  Created by cscoi052 on 2018. 7. 30..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

import UIKit

class searchGroupViewController: UIViewController, UITableViewDataSource {
   
    @IBOutlet weak var groupSearchBar: UISearchBar!
    @IBOutlet weak var searchTable: UITableView!
    
    var baseData : [String] = ["1", "2", "3"]
    var matchData : [String] = []
    
    func searchGroup(){
        for d in baseData{
            if groupSearchBar.text == d{
                matchData.append(d)
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTable.dequeueReusableCell(withIdentifier: "searchCell" , for: indexPath)
        var searchResult : String = matchData[indexPath.row]
        
        if let cellText = cell.textLabel{
            cellText.text = searchResult
        }
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
