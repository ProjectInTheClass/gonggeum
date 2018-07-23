//
//  main.swift
//  ProjectTest
//
//  Created by cscoi051 on 2018. 7. 23..
//  Copyright © 2018년 SOVS. All rights reserved.
//

import Foundation

print("Hello, World!")

// 회원 속성
class Member {
    //properties : 이름, 핸드폰번호
    var name : String
    var number : String
    
    init(){
        name = ""
        number = ""
    }
    
    init(_ name : String,_ number : String){
        self.name = name
        self.number = number
    }
    
}

class Club {
    //properties: 제목, 회원목록, 계좌
    var name : String
    var memberList : [Member]
    var account : String
    
    init(name:String){
        self.name = name; memberList = []; self.account = ""
    }
    
    //func : 추가, 삭제
    func add(member : Member){
        memberList.append(member)
    }
    
    func delete(name : String) -> Member?{
        var i = memberList.count
        while i > 0{
            if memberList[i].name == name{
                let ret = memberList.remove(at: i)
                return ret
            }
            i -= 1
        }
        return nil
    }
}

class Account {
    //properties : 잔액, 수입, 지출
    var money : Int
    var income : Int
    var expense : Int
    
    init(_ income : Int,_ expense : Int){
        self.money = 0; self.income = income; self.expense = expense
    }
    //func : 계산
    func cal() -> Int{
        money = money + income - expense
        return money
    }
}


