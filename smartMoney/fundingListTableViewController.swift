//
//  fundingListTableViewController.swift
//  smartMoney
//
//  Created by cscoi030 on 2018. 8. 6..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

import UIKit

class fundingListTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fundingList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fundingCell", for: indexPath)

        let item = fundingList[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.dueDate
        

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let indexPath = tableView.indexPathForSelectedRow,
        let detailVC = segue.destination as? fundingInfoController{
        let selectedfund : Funding = fundingList[indexPath.row]
        detailVC.getFunding = selectedfund
        }
    }

    


}
