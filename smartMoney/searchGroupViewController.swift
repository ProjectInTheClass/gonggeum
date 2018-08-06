//
//  searchGroupViewController.swift
//  smartMoney
//
//  Created by cscoi052 on 2018. 7. 30..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

import UIKit

let groupDefaultsKey = "groupDefaultsKey"

class searchGroupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var groupSearchBar: UISearchBar!
    @IBOutlet weak var searchTable: UITableView!
    
    // search bar 필요 변수
    var filteredData : [String]!
    
    // group 목록
    var groups = [Group]() {
        didSet {
            self.saveAll()
        }
    }
    
    // group 저장 관련 시작
    func saveAll() {
        let data = self.groups.map {
            [
                "title": $0.title,
                "members": $0.members
                ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey : groupDefaultsKey)
        userDefaults.synchronize()
    }
    // group 저장 관련 끝
    
    // group 불러오기 관련 시작
    func loadAll() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: groupDefaultsKey) as? [[String: AnyObject]] else {
            return
        }
        self.groups = data.flatMap {
            guard let title = $0["title"] as? String else {
                return nil
            }
            return Group(title: title)
        }
    }
    // group 불러오기 관련 끝
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTable.dequeueReusableCell(withIdentifier: "searchCell")!
        let group = self.groups[indexPath.row]
        cell.textLabel?.text = group.title
        
        return cell
    }
    
    
    
    //    // searchBar 관련 시작
    //    func searchBar(_ searchbar : UISearchBar, textDidChange searchText : String){
    //        filteredData = searchText.isEmpty; groups; : groups.filter({(dataString : String)->Bool in
    //        return dataString.range(of : searchText, options : .caseInsensitive) != nil})
    //        searchTable.reloadData() // 필터링된 데이터 기준으로 다시 테이블뷰 설정
    //    }
    //    // searchBar 관련 끝
    //
    //    // searchBar 취소 버튼 관련 시작
    //    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    //        self.searchBar.showsCancelButton = true // 취소버튼 보이기
    //    }
    //    // searchBar 취소 버튼 관련 끝
    //
    //    // searchBar 취소 버튼 관련 시작
    //    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    //        self.searchBar.showsCancelButton = false
    //
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 커스텀 셀 설정
        self.searchTable.dataSource = self
        self.searchTable.delegate = self
        self.groupSearchBar.delegate = self
        self.groupSearchBar.placeholder = "모임 검색"
        
        // 필터링 배열에 원본데이터배열 등록
        //        self.filteredData = self.groups
        
        self.loadAll()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigationController = segue.destination as? UINavigationController,
            let groupEditorViewController = navigationController.viewControllers.first as? GroupListEditController {
            groupEditorViewController.addInfo = { group in
                self.groups.append(group)
                self.searchTable.reloadData()
            }
        }
    }
}

