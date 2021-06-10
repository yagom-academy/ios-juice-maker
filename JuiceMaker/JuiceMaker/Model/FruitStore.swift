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

    func increaseStock(amount:Int = 1){
        count += amount
    }
    func decreaseStock(amount:Int = 1) throws {
        if count - amount >= 0{
            count -= amount
        }else {
            throw JuiceMaker.JuiceMakerError.countUnderZero
        }
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
