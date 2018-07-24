import Foundation

class Member {
    let name : String
    let phoneNumber : String
    
    init() {
        name = "정보 없음"
        phoneNumber = "정보 없음"
    }
    init(_ name : String, _ phoneNumber : String){
        self.name = name
        self.phoneNumber = phoneNumber
    }
}

class Club  {
    var clubName : String = ""
    var memberList : [Member]
    init(_ name : String) {
        clubName = name
        memberList = []
    }
    init(_ name : String, _ member : [Member]) {
        clubName = name
        memberList = []
        memberList += member
    }
    func add(_ member : [Member]) {
        memberList += member
    }
    func del(_ member : String){
        
        for i in 0..<memberList.count {
            if memberList[i].name == member{
                memberList.remove(at : i)
                break
                
            }
        }
        
    }
}

class Activity {
    let description : String
    var no :  [Member] = []
    var yes :  [Member] = []
    init(_ club : Club){
        description = "이 활동은 \(club.clubName)의 활동입니다."
        self.no += club.memberList
    }
    
    func check(){
        print("제출자")
        for i in no{
            print(i.name)
        }
        print("미제출자")
        for i in yes{
            print(i.name)
        }
    }
    
    func submit(_ member: String){
        var submitmem : Member = Member()
        for i in 0..<no.count{
            if no[i].name == member {
                submitmem = no.remove(at : i)
                break
            }
        }
        yes.append(submitmem)
        
    }
    
 
}

class Account {
    
}

