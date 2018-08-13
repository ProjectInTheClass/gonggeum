//
//  MoneyLog.swift
//  smartMoney
//
//  Created by cscoi050 on 2018. 8. 10..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

import Foundation

//initialize


struct accountInfo: Codable{
    var accountNum : String
    var owner : String
    var bankName : String
    var balance : Int
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

//GroupInfos = ["swift class" : [log1, log2, log3...]]
//AccountInfo = ["swift class" : {"accountNum" : "111-111-111",...}]
var GroupInfos : [String : [MoneyLog]] = [:]
var AccountInfo : [String : accountInfo] = [:]


var currentGroup : String?
var currentGroupLogs :[MoneyLog] = []


//json
let LogJsonPath = NSHomeDirectory() + "/Documents/moneyLog.json"
let LogJsonUrl = URL(fileURLWithPath: LogJsonPath)

//plist
let AccountInfoPath = NSHomeDirectory() + "/Documents/accountInfo.json"
var AccountInfoUrl = URL(fileURLWithPath: AccountInfoPath)


func loadLog(){
    // 파일에서 읽어서 logs에 대입
    let decoder = JSONDecoder()

    do{
        let data = try Data(contentsOf: LogJsonUrl)
        
        do{
            GroupInfos = try decoder.decode([String:[MoneyLog]].self, from: data)
            
            print(GroupInfos)
        }catch{
            print("error!!! cannot decode moneyLog.json file!!")
        }
        
    }catch{
        print("error!!! cannot read from moneyLog.json file")
    }
    
    
    do{
        let data = try Data(contentsOf: AccountInfoUrl)
        
        do{
            AccountInfo = try decoder.decode([String:accountInfo].self, from: data)
            print(AccountInfo)
        }catch{
            print("error!!! cannot decode accountInfo.json file!!")
        }
        
    }catch{
        print("error!!! cannot read from accountInfo.json file")
    }
    
 

    print("current Group : ", currentGroup)
    print("current Group Logs : ", currentGroupLogs)

    
}

func saveLog(){
    // logs를 파일로 저장
    
    let encoder = JSONEncoder()
    
    if let data = try? encoder.encode(GroupInfos) {
        do{
            print("moneylog file path in swift file", LogJsonPath)
            try! data.write(to: LogJsonUrl)
            }catch{
                print("error!! cannot save moneylog.json" )
        }
    }
    
    if let data = try? encoder.encode(AccountInfo) {
        do{
            print("accountinfo file path in swift file", AccountInfoPath)
            try! data.write(to: AccountInfoUrl)
        }catch{
            print("error!! cannot save accoutnInfo.json")
        }
    }
    
    //update infos back after saving
    loadLog()
}



func addLog(_ log: MoneyLog){
    if let cg = currentGroup {
        if GroupInfos[cg] != nil {
            GroupInfos[cg]!.append(log)
        }
        else {
            GroupInfos[cg] = [log]
        }
        
        if AccountInfo[cg] != nil {
            AccountInfo[cg]!.balance += log.InOut * log.money
        }else {
            print("AccountInfo[currentgroup] is nil!")
          
        }
    }

}


