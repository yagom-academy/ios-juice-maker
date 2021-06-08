import Foundation

enum Fruit {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

class FruitStore {
    var fruit: Fruit?
    var count = 10
    
    func increment(){
        count += 1
    }
    func increment(amount:Int){
        count += amount
    }
    func decrease(){
        count -= 1
    }
}

class Strawberry: FruitStore {
    override init() {
        super.init()
        self.fruit = Fruit.strawberry
    }
}

class Banana: FruitStore {
    override init() {
        super.init()
        self.fruit = Fruit.banana
    }
}

class Pineapple: FruitStore {
    override init() {
        super.init()
        self.fruit = Fruit.pineapple
    }
}

class Kiwi: FruitStore {
    override init() {
        super.init()
        self.fruit = Fruit.kiwi
    }
}

class Mango: FruitStore {
    override init() {
        super.init()
        self.fruit = Fruit.mango
    }
}
