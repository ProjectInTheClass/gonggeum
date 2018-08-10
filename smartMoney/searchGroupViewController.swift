//
//  searchGroupViewController.swift
//  smartMoney
//
//  Created by cscoi052 on 2018. 7. 30..
//  Copyright © 2018년 cscoi052. All rights reserved.
//  정해진 목록 나타나기 -> 검색어로 필터링된 배열 만들기 -> 테이블 이용 검색된 상태 검색된 배열 출력

import UIKit

let groupDefaultsKey = "groupDefaultsKey"

class searchGroupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var groupSearchBar: UISearchBar!
    @IBOutlet weak var searchTable: UITableView!
    
    // search bar 필요 변수
    var filteredData : [Group] = []
    
    var searchActive = false
    
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
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
        searchBar.showsCancelButton = true // 취소버튼 보이기
        print("여기")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
        searchTable.reloadData()
        print("저기")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        searchBar.showsCancelButton = false // 취소버튼 관련
        searchTable.reloadData()
        print("요기")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive){
            return filteredData.count
        }
        else{
            return groups.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTable.dequeueReusableCell(withIdentifier: "searchCell")!
        if(searchActive){
            cell.textLabel?.text = filteredData[indexPath.row].title
        }
        else{
            let group = self.groups[indexPath.row]
            cell.textLabel?.text = group.title
        }
        return cell
    }
    //
    //    // searchBar 관련 시작
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            searchTable.reloadData()
            return
        }
        filteredData = groups.filter({group -> Bool in
            group.title.lowercased().contains(searchText.lowercased())
        })
        searchTable.reloadData()
    }
    //
    //
    
    // searchBar 관련 끝
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 커스텀 셀 설정
        searchTable.dataSource = self
        searchTable.delegate = self
        groupSearchBar.delegate = self
        self.groupSearchBar.placeholder = "모임 검색"
        
        //        self.filteredData = [self.groups[0].title]
        //        print(self.groups[0].title)
        //
        //        if groups.count != 0{
        //            for i in 0..groups.count{
        //            filteredData.append(self.groups[i].title)
        //            }
        //        }
        
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
