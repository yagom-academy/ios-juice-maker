import Foundation

//enum Fruit {
//    case strawberry
//    case banana
//    case pineapple
//    case kiwi
//    case mango
//}

class Fruit {
    //var fruit: Fruit?
    var stock: Int
    
    init(stock:Int = 10) {
        self.stock = stock
    }

    func increaseStock(amount:Int = 1){
        stock += amount
    }
    func decreaseStock(amount:Int = 1) throws {
        if stock - amount >= 0{
            stock -= amount
        }else {
            throw JuiceMaker.JuiceMakerError.countUnderZero
        }
    }
}











//
//class Strawberry: Fruit {
//}
//
//class Banana: Fruit {
//
//}
//
//class Pineapple: Fruit {
//}
//
//class Kiwi: Fruit {
//
//}
//
//class Mango: Fruit {
//
//}
