//
//  MoneyLog.swift
//  smartMoney
//
//  Created by cscoi050 on 2018. 8. 10..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

import Foundation

//initialize

struct GroupInfo:Codable{
    var name: String
    var logs: [MoneyLog]
}

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



//var logs : [MoneyLog] = []
var GroupInfos : [GroupInfo] = []


//var currentGroup : String?
//var currentGroupLogs :[MoneyLog] = []


var currentGroup : String = "test group"
var currentGroupLogs :[MoneyLog] = [MoneyLog(y:1, m:2, d: 3, eventName: "hi", money: 1, memo: "1", InOut: 1)]

//var balanceInfo = 0

//json
let LogJsonPath = NSHomeDirectory() + "/Documents/moneyLog.json"
let LogJsonUrl = URL(fileURLWithPath: LogJsonPath)

//plist
let AccountInfoPath = Bundle.main.path(forResource: "AccountInfo", ofType: "plist")
var accountInfo = NSMutableDictionary(contentsOfFile: AccountInfoPath!)


func loadLog(){
    // 파일에서 읽어서 logs에 대입
    let decoder = JSONDecoder()
    
    print("======", LogJsonUrl)
    print("======", LogJsonPath)
    
    print("======", AccountInfoPath)
    print("======", accountInfo)
    
    print(currentGroup)
    print(currentGroupLogs)
    
    if let data = try? Data.init(contentsOf: LogJsonUrl), let infosFromFile = try? decoder.decode([GroupInfo].self, from: data){
        print("개수 : ", infosFromFile.count)
        if infosFromFile.count > 0 {
            GroupInfos = infosFromFile
            currentGroupLogs = infosFromFile[0].logs
        }
        else {
            currentGroup = "test group"
            currentGroupLogs = [MoneyLog(y:1, m:2, d: 3, eventName: "hi", money: 1, memo: "1", InOut: 1)]
        }
        
        //initialize current Group to first group in JSON file
        //currentGroup = infosFromFile[0].name
        print("current Group : ", currentGroup)
        print("current Group Logs : ", currentGroupLogs)
    }
    
    // plist
    
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
    currentGroupLogs.append(log)
    
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
