//
//  MoneyLog.swift
//  smartMoney
//
//  Created by cscoi050 on 2018. 8. 10..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

import Foundation

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

var logs : [MoneyLog] = []
let LogJsonPath = NSHomeDirectory() + "/Documents/moneyLog.json"
let LogJsonUrl = URL(fileURLWithPath: LogJsonPath)

func saveLog(){
    // logs를 파일로 저장

    
    print ("json file path in swift file : " + LogJsonPath)
    

    let encoder = JSONEncoder()
    
    if let data = try? encoder.encode(logs) {
            try! data.write(to: LogJsonUrl)
        }
    
    print("saving logs[] to JSON file finished!")
}


func loadLog(){
    // 파일에서 읽어서 logs에 대입
    let decoder = JSONDecoder()
    
    if let data = try? Data.init(contentsOf: LogJsonUrl), let logsFromFile = try? decoder.decode([MoneyLog].self, from: data){
        print (logsFromFile[1])
        print("개수 : ", logsFromFile.count)
        logs = logsFromFile
    }
    
    
}

func addLog(_ log: MoneyLog){
    logs.append(log)
    updateBalance(IsIn: log.InOut, howMuch: log.money)
}

func updateBalance(IsIn :Int, howMuch :Int){
    if let AccountInfoPath = Bundle.main.path(forResource: "AccountInfo", ofType: "plist"), let accountInfo = NSMutableDictionary(contentsOfFile: AccountInfoPath){
        var balanceInfo = accountInfo.object(forKey: "balance") as! Int
        balanceInfo = balanceInfo + IsIn * howMuch
        accountInfo.write(toFile: AccountInfoPath, atomically: true)
        
        print("changed in balance to ", balanceInfo)
    }
    
    
}
