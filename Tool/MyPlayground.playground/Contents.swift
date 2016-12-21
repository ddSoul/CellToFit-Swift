//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

print("hello")

var array = ["2","6","3","5"];
//for item in array {
//    print("each :\(item)\n")
//}
//for i in (1..<10).reversed() {
//    print("\(i)")
//}
//
//for i in stride(from: 10, to: 1, by: -2) {
//    print(i)
//}

//let score1 = (chinese:100, math:90)
//let score2 = (chinese:90, math:100)
//
//func <(t1:(Int,Int),t2:(Int,Int)) -> Bool
//{
//    if t1.1 == t2.1 {
//        return t1.0 < t2.0
//    }
//    return t1.1 < t2.1
//}
//
//score1 < score2
//
//func printScore(chinses: Int, math: Int)
//{
//    print("chinses:\(chinses) \n math:\(math)")
//}
//
//printScore(chinses: score1.chinese, math: score1.math)
array.remove(at: 1)

print("这个字符的索引是：\(array.index(of: "5"))")

func test(_ name: String, _ age: String)
{
    print("name :\(name) -- age: \(age)")
}


//class studentList{
//    var students : [String]
//    init( students :[String]) {
//        self.students = students
//    }
//    
//    func addStudent(name:String, at index:Int) {
//        self.students.insert(name, at: index)
//    }
//    
//    func addStudent(name:String, before studen:String) {
////        self.students.insert(name, at: )
//    }
//    
//    func addStudent(name:String, after studen:String) {
////        <#function body#>
//    }
//}

//func test(name : String, age:String) -> Void{
//    print("hllo")
//}
//
//test("ss", "s")
//
//func testl(name:String? , age:String){
//    print("ooo")
//}
//
//testl(name: "sss", age: "ss")

func swpet<T>( _ a:inout T, _ b:inout T){
    (a,b) = (b,a)
}

var str1 = "sss"
var str2 = "www"

swpet(&str1, &str2)

//str2


struct Student :Comparable,Equatable,CustomStringConvertible{
    var source :Int
    var name   :String
    
    var description: String{
        return "Source:" + String(source)
    }
}
func ==(s1 :Student, s2:Student) ->Bool{
    return s1.source == s2.source
}
func <(s1 :Student, s2:Student) ->Bool{
return s1.source < s2.source
}

//
//let student1 = Student(source:99, name: "dengdeng")
//student1.description
//
//let a = Student(source:88, name: "astudent")
//let b = Student(source:77, name: "bstudent")
//
//let students = [student1, a, b]
//
//func topOne<T:Comparable>(seq:[T]) -> T{
//    assert(seq.count>0)
//    return seq.reduce(seq[0]){
//        max($0,$1)
//    }
//}
//
//topOne(seq: [9,6,5])
//topOne(seq: ["swift","object-c","javaScript"])
//若是多个协议的话  T:protocol<p1,p2>

//委托模式
protocol turnBaseGame{
    var turn: Int{set get}
    func play()
}

//协议
protocol turndelegate{
    func startGame()
    func playMove()
    func gameEnd()
    func gameOver() ->Bool
}
//base Class
class SinglerPalyGameBase:turnBaseGame {

    var turn: Int = 0
    
    var delegate: turndelegate!
    
    internal func play() {
        
        delegate.startGame()
        
        while !delegate.gameOver() {
            print("game 继续...")
            delegate.playMove()
            turn += 1
        }
        delegate.gameEnd()
    }
}

//游戏类
class gameTurmnClass : SinglerPalyGameBase, turndelegate{
    var source = 0
    
    override init() {
        super.init()
        delegate = self
    }
    
    internal func startGame() {
        source = 0
        turn = 0
        print("geme start====")
    }
    internal func playMove() {
        let roleNum = Int(arc4random())%6+1
        source += roleNum
        print("you win:\(source)")
    }
    internal func gameEnd() {
        print("Win:::;;;;;;")
    }
    
    func gameOver() -> Bool {
        return source>=100
    }
}

//class

class testEm{
    enum nameString:Int {
        case zs
        case ls
        func yourName(){
            print("your name is:")
        }
    }
    
    static func go() ->nameString{
        return nameString(rawValue: 1)!
    }
}

let ttt = testEm.go()
//nameStringT.yourName()


let game = gameTurmnClass()
game.play()



