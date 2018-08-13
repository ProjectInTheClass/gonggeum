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

    @IBOutlet weak var groupSearch: UISearchBar!
    @IBOutlet weak var searchTable: UITableView!
    
    @IBAction func groupAddCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func groupAdd(_ sender: Any) {
        if let indexPath = searchTable.indexPathForSelectedRow {
            let selectedGroup = self.group[indexPath.row]
            self.addInfo?(selectedGroup)
            print(selectedGroup.title)
            self.dismiss(animated: true, completion: nil)
        }
        else {
            let checkAction = UIAlertAction(title: "확인", style: .default) { _ in
                self.groupSearch.becomeFirstResponder()
            }
            let alertController = UIAlertController(
                title: "주의!",
                message: "선택된 모임이 없습니다.",
                preferredStyle: .alert
            )
            alertController.addAction(checkAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    // search bar 필요 변수
    var filteredData : [Group] = []
    
    var searchActive = false
    
    var addInfo: ((Group) -> Void)?
    
    var group = [Group](){
        didSet{
            self.saveAll()
        }
    }
    
    // group 저장 관련 시작
    func saveAll() {
        var data = self.group.map {
            [
                "title": $0.title,
                ]
        }
        if self.group.count == 0{
            data.append(["title": "맛집"])
            data.append(["title": "영화감상"])
            data.append(["title": "독서모임"])
            data.append(["title": "여행"])
            data.append(["title": "경영전략"])
            data.append(["title": "블록체인"])
            data.append(["title": "볼링"])
            data.append(["title": "산악"])
            data.append(["title": "밴드"])
            data.append(["title": "노래"])
            data.append(["title": "합창"])
            data.append(["title": "경제"])
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
        self.group = data.compactMap {
            guard let title = $0["title"] as? String else {
                return nil
            }
            return Group(title: title)
        }
    }
    // group 불러오기 관련 끝
    
    // 모임 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            self.group.remove(at: indexPath.row)
            searchTable.reloadData()
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        //searchActive = true
        searchBar.showsCancelButton = true // 취소버튼 보이기
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
        searchTable.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        searchBar.showsCancelButton = false // 취소버튼 관련
        searchTable.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = true
        let keyword = groupSearch.text
        self.searchDisplayController?.isActive = false
        groupSearch.text = keyword
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive){
            return filteredData.count
        }
        else{
            return self.group.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTable.dequeueReusableCell(withIdentifier: "searchCell")!
        if(searchActive){
            cell.textLabel?.text = filteredData[indexPath.row].title
        }
        else{
            let group = self.group[indexPath.row]
            cell.textLabel?.text = group.title
        }
        return cell
    }
    
    // searchBar 관련 시작
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            searchActive = false
            searchTable.reloadData()
            return
        }
        searchActive = true
        filteredData = self.group.filter({group -> Bool in
            group.title.lowercased().contains(searchText.lowercased())
        })
        searchTable.reloadData()
    }
    // searchBar 관련 끝
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 커스텀 셀 설정
        searchTable.dataSource = self
        searchTable.delegate = self
        groupSearch.delegate = self
        self.groupSearch.placeholder = "모임 검색"
        
        self.loadAll()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let groupEditorViewController = segue.destination as? GroupListEditController {
            groupEditorViewController.addInfo = { group in
                self.group.append(group)
                self.searchTable.reloadData()
            }
        }
    }
}

