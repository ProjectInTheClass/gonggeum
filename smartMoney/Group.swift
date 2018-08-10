
import Foundation

class Group {
    var title: String
    var members: [String]
    
    init(title: String) {
        self.title = title
        members = []
    }
}

var grouplist = [
    Group(title: "맛집"),
    Group(title: "영화감상"),
    Group(title: "독서모임"),
    Group(title: "여행"),
    Group(title: "경영전략"),
    Group(title: "블록체인"),
    Group(title: "볼링")
    ]

var groups = [
    Group(title: "맛집"),
    Group(title: "영화감상"),
    Group(title: "독서모임"),
    Group(title: "여행"),
    Group(title: "경영전략"),
    Group(title: "블록체인"),
    Group(title: "볼링"),
    Group(title: "산악"),
    Group(title: "밴드"),
    Group(title: "노래"),
    Group(title: "합창"),
    Group(title: "경제")
    ]
