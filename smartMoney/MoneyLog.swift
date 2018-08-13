//
//  MoneyLog.swift
//  smartMoney
//
//  Created by cscoi050 on 2018. 8. 10..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

import Foundation

//initialize

struct MoneyLog: Codable{
    var y: Int
    var m: Int
    var d: Int
    var eventName: String
    var money: Int
    var memo: String
    var InOut: Int
    //evidence info? image? string?
}

//GroupInfos = ["swift class" : [log1, log2, log3...]]
var GroupInfos : [String : [MoneyLog]] = [:]

var currentGroup : String?
var currentGroupLogs :[MoneyLog] = []


//json
let LogJsonPath = NSHomeDirectory() + "/Documents/moneyLog.json"
let LogJsonUrl = URL(fileURLWithPath: LogJsonPath)

//plist
let AccountInfoPath = Bundle.main.path(forResource: "AccountInfo", ofType: "plist")
var accountInfo = NSMutableDictionary(contentsOfFile: AccountInfoPath!)


func loadLog(){
    // 파일에서 읽어서 logs에 대입
    let decoder = JSONDecoder()

    do{
        let data = try Data(contentsOf: LogJsonUrl)
        
        do{
            GroupInfos = try decoder.decode([String:[MoneyLog]].self, from: data)
            print(GroupInfos)
        }catch{
            print("error!!! cannot decode JSON file!!")
        }
        
    }catch{
        print("error!!! cannot read from JSON file")
    }
    
 

    print("current Group : ", currentGroup)
    print("current Group Logs : ", currentGroupLogs)

    
}

func saveLog(){
    // logs를 파일로 저장
    
    let encoder = JSONEncoder()
    
    if let data = try? encoder.encode(GroupInfos) {
            print("JSON file path in swift file", LogJsonPath)
            try! data.write(to: LogJsonUrl)
            print("saving logs[] to JSON file finished!")
        }
    
    
    // plist 저장
    if let path = AccountInfoPath, let info = accountInfo{
        info.write(toFile: path, atomically: true)
        print("finished updating balance in plist")
        print(info)
    }
}



func addLog(_ log: MoneyLog){
    if let cg = currentGroup {
        if GroupInfos[cg] != nil {
            GroupInfos[cg]!.append(log)
        }
        else {
            GroupInfos[cg] = [log]
        }
    }
    //update balance in plist
    if let info = accountInfo{
        var balanceInfo = info.object(forKey: "balance") as! Int
        balanceInfo += log.InOut * log.money
    }

}

func updateBalance(IsIn :Int, howMuch :Int){
    
    
//    if let AccountInfoPath = Bundle.main.path(forResource: "AccountInfo", ofType: "plist"), let accountInfo = NSMutableDictionary(contentsOfFile: AccountInfoPath){
//        var balanceInfo = accountInfo.object(forKey: "balance") as! Int
//        balanceInfo = balanceInfo + IsIn * howMuch
//        accountInfo.write(toFile: AccountInfoPath, atomically: true)
//
//        print("changed in balance to ", balanceInfo)
//    }
    
    
}
