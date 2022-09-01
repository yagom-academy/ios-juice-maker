//
//  Fruits.swift
//  Created by Wonbi, woong
//

struct Fruits {
    enum FruitType: Int {
        case strawberry = 0
        case banana
        case pineapple
        case kiwi
        case mango
        
        static fileprivate func makeList() -> [Self] {
            var fruitList = [Self]()
            var fruitIndex: Int = Self.strawberry.rawValue
            
            while FruitType(rawValue: fruitIndex) != nil {
                if let fruit = Self(rawValue: fruitIndex) {
                    fruitList.append(fruit)
                    fruitIndex += 1
                }
            }
            return fruitList
        }
    }
    
    var name: FruitType
    var count: Int
    var fruitIndex: Int {
        self.name.rawValue
    }
    
    init(name: FruitType, count: Int) {
        self.name = name
        self.count = count
    }
    
    static func makeDefaultStock(defaultCount: Int) -> [Self] {
        let fruitList = FruitType.makeList()
        var defaultStock = [Self]()
        for fruit in fruitList {
            defaultStock.append(Fruits(name: fruit, count: defaultCount))
        }
        return defaultStock
    }
}

//extension Fruits.FruitType: CaseIterable {
//    static let fruitsList = Self.allCases
//}

// 아래 allCases 때문에 사용한 것 같은데.. CaseIterable를 사용하지 않고 구현하는 방법은 없을까요?
// Caseliterable을 FruitName의 프로토콜로 채택하지않고 extension을 통해 fruitsList에 접근할 때만 caseIterable을 채택하도록 구현해보았습니다.
// 이 방법 외에는 매직넘버를 사용할 수 밖에없어서 그 선택지는 선택하지않았습니다.

//self는 인스턴스 자기자신을 참조할 때 사용하고, Self는 그 인스턴스 타입 자체을 참조할 때 사용합니다! 암시적 프로퍼티인 self의 타입은 Self입니다!
