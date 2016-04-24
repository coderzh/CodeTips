/*
 swift.playground:
 Swift 速学速查速用代码手册
 Source: github.com/coderzh/CodeTips/blob/master/swift.swift
 Author: coderzh(github.com/coderzh)
 Blog: http://blog.coderzh.com
 参考：《Swift Programming Language》
 */

import Cocoa

// 0. 注释
/*
块注释
行尾分号可不用
*/

// 1. Hello World
print("Hello Swift")

// 2. 常量变量类型
let constValue = 3.14
var variable = 18

variable += 1

// 指定类型
let age: Int = 18
// 多重赋值
var (a, b) = (1, 2)
// 匿名占位符
(_, b) = (3, 4)

// 类型会自动推导
let name = "It's a string"
let gravity = 0.98 // 默认 double

// 永远不做隐式转换，必须自己强转
let sum = Double(age) + gravity

// 运算：+, -, *, /, % 求余
// 比较：<, >, ==, >=, <=, !=
// === 恒等，是否为同一个对象
// !== 不恒等
// 位运算：~x 取反，& 与，| 或，^ 异或，<< 左移动，>> 右移
// 溢出运算符 &+ &- &* &/ &% ，这样溢出部分就会丢掉，不会出错，比如：
var willOverflow = UInt8.max
willOverflow = willOverflow &+ 1 // = 0

// 类型
let b1 = true
let i32: Int32 = 6
let f64: Float64 = 3.1415

// 字符串
let str = "swift"
// 字符串连接，使用\()
var hello = "hello \(str)"
let count = str.characters.count
let c = hello[hello.startIndex]
for i in hello.characters.indices {
    print("\(hello[i])")
}

hello.insert("!", atIndex: hello.endIndex)
hello.insertContentsOf(" there".characters, at: hello.endIndex.predecessor())
hello.removeAtIndex(hello.endIndex.predecessor())
hello.hasPrefix("hello")
hello.hasSuffix("swift")

let unicode = "你好 swift"
unicode.characters.count // 8

for codeUnit in unicode.utf8 {
    print("\(codeUnit)", terminator: "")
}
if hello == unicode{
    
}

// 数组
var shoppingList = ["test", "book", "bike"]
shoppingList[2] = "joke"
shoppingList.append("bus")
shoppingList.insert("foo", atIndex: 0)
shoppingList.removeAtIndex(0)

// 类似 slice
shoppingList[0..<2] // ["test", "book"]
shoppingList[0...2] // ["test", "book", "joke"]

for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerate() {
    print("\(index): \(value)")
}

let emptyArray = [String]()
var someInts = [Int]()
var someInts2 = [Int](count: 3, repeatedValue: 8) // [8, 8, 8]
var someInts3 = [Int](count: 3, repeatedValue: 2)

// 任意类型数组
var anyArray = [Any]()
anyArray.append(1)
anyArray.append("book")

someInts = someInts2 + someInts3 // [8, 8, 8, 2, 2, 2]

// 元组
let httpResponse = (404, "Not Found")
print(httpResponse.0)

// 集合 Sets
var setBooks: Set<String> = ["book1", "book2"]
// 自动推导
var setBooks2: Set = ["book1", "book2", "book3"]

setBooks.intersect(setBooks2)  // 交集
setBooks.exclusiveOr(setBooks2)  // 非交集
setBooks.union(setBooks2)  // 并集
setBooks.subtract(setBooks2)  // 减集

setBooks.isSubsetOf(setBooks2)
setBooks2.isSupersetOf(setBooks)
setBooks.isStrictSubsetOf(setBooks2)  // 被包含且不相等

// 字典
var map = [
    "Malcolm": "hehe",
    "Keylee": 123,
]
map["Keylee"] = 166

var namesOfInt = [Int: String]()
namesOfInt[10] = "ten"

if let oldValue = namesOfInt.updateValue("Ten", forKey: 10) {
    print("\(oldValue)")
}

if let name = namesOfInt[8] {
    print("\(name)")
} else {
    print("not exist 8")
}

for (intKey, strValue) in namesOfInt {
    print("\(intKey):\(strValue)")
}

// namsOfInt.values
for intKeys in namesOfInt.keys {
    
}

let intKeys = [Int](namesOfInt.keys)

// 可空变量，用 ?
var optionalString: String? = nil

if let name = optionalString {
    print("hello \(name)")
}

// 3. 流程控制
// 循环
// [0, 4)
for i in 0..<4 {
    print("print \(i)")  // 4 times
}

// [0, 4]
for i in 0...4 {
    print("print \(i)")  // 5 times
}

var i = 0
while i < 2 {
    print("\(i)")
    i += 1
}

repeat {
    print("\(i)")
    i += 1
} while i < 5

// 判断
if i < 5 {
    
} else if i < 10 {
    
} else {
    
}

// 强大的 switch
// 不需要 break
switch i {
case 1, 2, 3:
    print("123")
case 5:
    print("5")
case 6..<10:
    print("6-9")
default:
    print("default")
}

let somePoint = (1, 1)

switch somePoint {
case (0, 0):
    print("0, 0")
case (_, 1):
    print("y is 1")
case (-2...2, -2...2): // 区间
    print("from (-2,-2) to (2, 2)")
case (let x, 0):  // 值绑定
    print("\(x)")
case let (x, y) where x == y:  // where
    print("x == y")
case (10, 11):
    fallthrough  // 贯穿，继续向下
default:
    print("default")
}

// 控制转移
// continue break fallthrough retrun throw

// 带标签
i = 0
gameLoop: while i > -1 {
    i = i + 1
    if i > 3 {
        break gameLoop
    }
}

// 提前退出(提前返回)
func greet(person: [String:String]) {
    guard let name = person["name"] else {
        return
    }
    print("\(name)")
}

greet(["age":"18"])

// 4. 函数
func greet(name: String, day: String) {
    print("Hello \(name), today is \(day)")
}

// 第二个参数默认需要指定名称
greet("tom", day: "2016")

func sum(a: Int, b: Int) -> Int {
    return a + b
}

sum(1, b: 2)

// 多重返回值
func minMax(array: [Int]) -> (min: Int, max: Int) {
    // ...
    return (0, 1)
}

// 可选返回值加 ?
func minMax2(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    return (0, 1)
}

// 指定外部参数名
func sayHello(to person: String, and anotherPerson: String) {
    print("Hello \(person) and \(anotherPerson)")
}

sayHello(to: "coderzh", and: "tom")

// 忽略外部参数名，使用 _
func sayHello2(person: String, _ anotherPerson: String) {
    print("Hello \(person) and \(anotherPerson)")
}

sayHello2("coderzh", "jack")

// 默认参数
func someFunction(p: Int = 10) {
    print("\(p)")
}

someFunction()

// 可变参数
func sum(numbers: Int...) -> Int {
    var total = 0
    for n in numbers {
        total += n
    }
    
    return total
}

sum(1, 2, 3, 4, 5)

// 参数默认是常量类型，如需指定变量类型，前面加 var（swift 3 将移除 var）
func alignRight(var string: String, totalLength: Int, pad: Character) -> String {
    string = string + "!"
    return string
}

// 传入传出参数 inout
func swap(inout a: Int, inout _ b: Int) {
    let temp = a
    a = b
    b = temp
}

var someInt = 7
var anotherInt = 8

// inout 参数必须加 &
swap(&someInt, &anotherInt)

// 函数类型，函数变量
var sumFunc: (Int, Int) -> Int = sum
sumFunc(1, 2)

// 函数可做参数
func doSum(handler:(Int, Int) -> Int, _ a: Int, _ b: Int) {
    handler(a, b)
}

// 函数可做返回值
func getSum() -> (Int, Int) -> Int {
    // 函数可嵌套
    func someFunc(a: Int, b: Int) -> Int { return a + b }
    return someFunc
}

doSum(sum, 2, 3)

// 闭包
// 闭包是引用类型
let reversed2 = shoppingList.sort({a, b in a < b})
let r = shoppingList.sort({ $0 < $1 })
let r2 = shoppingList.sort(<)
let r3 = shoppingList.sort{ $0 < $1 }

// 非逃逸闭包（noescape closure）
// 闭包只能在函数内执行，不能「逃逸」出去
func someClosure(@noescape closure: () -> Void) {
    closure()
}

// 自动闭包（这样不用写花括号了？）
func autoClosure(@autoclosure provider: () -> String) {
    provider()
}

autoClosure(shoppingList.removeAtIndex(0))

// 5. 枚举（一等公民，十分强大）
// 值类型
enum Rank: Int {
    case Ace = 1
    case Two, Three
}

var ace = Rank.Ace  // Ace
Rank.Ace.rawValue  // 1
let ace1 = Rank(rawValue: 1)  // Ace
ace = .Two

enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

// 可失败构造器
enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}


let success = ServerResponse.Result("6:00am", "6:00pm")
let failure = ServerResponse.Error("Out of cheese")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "sunrise at \(sunrise), sunset at \(sunset)"
case let .Error(error):
    let serverResponse = "Error \(error)"
}

// 枚举递归...
enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .Number(let value):
        return value
    case .Addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .Multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

// 计算 (5 + 4) * 2
let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum2 = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum2, ArithmeticExpression.Number(2))
print(evaluate(product)) // 输出 "18”

// 6. 类和结构体
// 结构体是值类型，类是引用类型
class SomeClass {
    var width = 0
    var height = 0
    
    // class 不需要 mutating
    func incrementWidth() {
        self.width += 1
    }
    
    // 下标操作： [n]
    subscript(index: Int) -> Int {
        get {
            return 0
        }
        set(newValue) {
            // set from newValue
        }
    }
}

let s1 = SomeClass()

struct SomeStruct {
    static var someValue = 100
    static func staticFunc() -> Int {
        return 1
    }
    
    var x = 0
    var y = 0
    
    var doubleX: Int {
        get {
            return x * 2
        }
        set {
            x = newValue / 2
        }
    }
    
    // readonly
    var doubleY: Int {
        return y * 2
    }
    
    var total: Int {
        willSet(newTotal) {
            print("will set \(newTotal)")
        }
        
        didSet {
            print("old: \(oldValue), new: \(total)")
        }
    }
    
    // 如果会改变类成员，比如声明 mutating
    mutating func incrementX() {
        self.x += 1
    }
}

var s2 = SomeStruct(x: 2, y: 3, total: 10)
s2.doubleX = 10  // s2.x == 5
s2.total = 5

// 继承
class Animal {
    // 构造函数
    init() {
        
    }
    
    // 必要构造器，子类必须实现，而且声明为 required
    required init(name: String, age: Int) {
        
    }
    
    func makeNoise() {
        print("wowowo")
    }
}

class Cat: Animal {
    var name: String = ""
    var nickName: String = ""
    
    init(name: String) {
        super.init()
        self.name = name
    }
    
    init(fromNickName nickName: String) {
        super.init(name: nickName, age: 18)
        self.nickName = nickName
    }
    
    // 便利构造器：必须调用其他构造器
    convenience override init() {
        self.init(name: "UnKnown")
    }
    
    // 可失败构造器
    init?(age: Int) {
        super.init(name: "UnKnown", age: age)
        if age < 0 { return nil }
    }
    
    required init(name: String, age: Int) {
        self.name = name
        super.init(name: name, age: age)
    }
    
    // 析构，默认会先调用父类的析构
    deinit {
        
    }
    
    override func makeNoise() {
        print("miaomiaomiao")
    }
}

final class CannotInheirt {
    
}

// 7. 自动引用计数 ARC
// weak 弱引用
// unowned 无主引用

// 8. 可空链式调用
/* For example:
if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}
*/
// 如果确定有值，使用!
// let roomCount = john.residence!.numberOfRooms


// 9. 错误处理

enum CustomError : ErrorType {
    case Invalid
    case OutOfRange
}

func makeASandwich() throws -> String {
    throw CustomError.Invalid
}

do {
    try makeASandwich()
} catch CustomError.Invalid {
    print("Invalid")
}

// 可空
let x = try? makeASandwich()
// 使错误传递失效，肯定不throw，否则 assert
// let y = try! makeASandwich()

// defer 和 Golang 里的 defer 一样，用来退出清理
/*
func processFile(filename: String) throws {
    if exists(filename) {
        let file = open(filename)
        defer {
            close(file)
        }
        while let line = try file.readline() {
            // 处理文件
        }
        // 在这里，作用域的最后调用 close(file)
    }
}
*/

// 10. 类型转换： is as （和 CSharp 类似）
// 任意类型：
// 1. AnyObject 任何 class 类型实例
// 2. Any 任何类型

// 11. 扩展（extension，类似 CSharp 里的扩展方法，但是貌似更强大）
// 比如：扩展内置类型 Double
// 几乎一切都可扩展，用到时再查用法吧
extension Double {
    var km: Double { return self * 1_000.0 }
    var m : Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

// 12. 协议（类似接口的东西）
// 当同时有继承时，先写继承，再写协议，协议可以有多个
protocol FullyNamed {
    var fullName: String { get }
}

// 协议也可继承
protocol SubFullyNamed: FullyNamed {
    var nickName: String { get }
}

struct Person: FullyNamed{
    var fullName: String
}

// 专属协议，指定只能用在 class 上
protocol ClassOnlyProtocol: class, FullyNamed {
    
}

protocol Aged {
    var age: Int { get set }
}

// 协议合成
func foo(pro: protocol<FullyNamed, Aged>, base: Any) {
    // 协议判断
    if let p = base as? Aged {
        print(p.age)
    }
}

// 可选协议（既然是协议，还可选，醉了）
// @objc protocol

// 13. 泛型
func swapTwoValues<T>(inout a: T, inout _ b: T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

// 泛型约束
func someFunction<T: SomeClass, U: FullyNamed>(someT: T, someU: U) {
    // 这里是函数主体
}

// Where
/*
func allItemsMatch<
    C1: Container, C2: Container
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable>
    (someContainer: C1, anotherContainer: C2) -> Bool {
}
*/
    
// 14. 访问控制
// public internal（默认） private 
// 加在 class var 等前
