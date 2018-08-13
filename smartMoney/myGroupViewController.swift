//
//  myGroupViewController.swift
//  smartMoney
//
//  Created by cscoi052 on 2018. 7. 30..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

import UIKit

let grouplistDefaultsKey = "grouplistDefaultsKey"

class myGroupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var groupsTable: UITableView!
    
    // grouplist 관련
    var grouplist = [Group]() {
        didSet{
            self.saveAll()
        }
    }
    
    // group 저장 관련 시작
    func saveAll() {
        var data = self.grouplist.map {
            [
                "title": $0.title,
                ]
        }
        if self.grouplist.count == 0{
            data.append(["title": "맛집"])
            data.append(["title": "영화감상"])
            data.append(["title": "독서모임"])
            data.append(["title": "여행"])
            data.append(["title": "경영전략"])
            data.append(["title": "블록체인"])
            data.append(["title": "볼링"])}
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey : grouplistDefaultsKey)
        userDefaults.synchronize()
    }
    // group 저장 관련 끝
    
    
    // group 불러오기 관련 시작
    func loadAll() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: grouplistDefaultsKey) as? [[String: AnyObject]] else {
            return
        }
        self.grouplist = data.flatMap {
            guard let title = $0["title"] as? String else {
                return nil
            }
            return Group(title: title)
        }
    }
    // group 불러오기 관련 끝
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupsTable.dataSource = self
        groupsTable.delegate = self
        
        self.loadAll()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        groupsTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return grouplist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myGroups", for: indexPath)
        //        if let g = cell.textLabel{
        //            g.text = grouplist[indexPath.row].title
        //        }
        //
        let group = self.grouplist[indexPath.row]
        cell.textLabel?.text = group.title
        
        return cell
    }
    
    // 모임 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            grouplist.remove(at: indexPath.row)
            groupsTable.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = self.groupsTable.indexPathForSelectedRow, let nextVC = segue.destination as? moneyLogViewController{
            let selectedData = grouplist[indexPath.row].title
            nextVC.data = selectedData
        }
        if let searchGroupViewController = segue.destination as? searchGroupViewController {
            searchGroupViewController.addInfo = { group in
                self.grouplist.append(group)
                self.groupsTable.reloadData()
            }
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
}
