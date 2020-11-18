import Foundation

class fruit {
    var name : String = "unknown"
    var stock : Int = 0
    
    init(name : String, stock : Int) {
        self.name = name
        self.stock = stock
    }
}

var strawberry : fruit = fruit(name : "strawberry", stock: 10)
var banana : fruit = fruit(name : "banana", stock: 10)
var pineapple : fruit = fruit(name : "pineapple", stock: 10)
var kiwi : fruit = fruit(name : "kiwi", stock: 10)
var mango : fruit = fruit(name : "mango", stock: 10)

var strawberryStock : Int {
    get {
        return strawberry.stock
    }
}

var bananaStock : Int {
    get {
        return banana.stock
    }
}

var pineappleStock : Int {
    get {
        return pineapple.stock
    }
}

var kiwiStock : Int {
    get {
        return kiwi.stock
    }
}

var mangoStock : Int {
    get {
        return mango.stock
    }
}

enum fruitJuice : Int {
    case strawberryJuice = 1
    case bananaJuice = 2
    case strawberryBananaJuice = 3
    case pineappleJuice = 4
    case kiwiJuice = 5
    case mangoJuice = 6
    case mangoKiwiJuice = 7
}

var strawberryJuice = fruitJuice.strawberryJuice.rawValue
var bananaJuice = fruitJuice.bananaJuice.rawValue
var strawberryBananaJuice = fruitJuice.strawberryBananaJuice.rawValue
var pineappleJuice = fruitJuice.pineappleJuice.rawValue
var kiwiJuice = fruitJuice.kiwiJuice.rawValue
var mangoJuice = fruitJuice.mangoJuice.rawValue
var mangoKiwiJuice = fruitJuice.mangoKiwiJuice.rawValue

class juiceMaker {
    func vetifyStock(whichFruitJuice: Int) {
        switch whichFruitJuice {
        case strawberryJuice:
            if strawberry.stock < 16 {
                //alert으로 수정예정
                print("재료가 모자라요. 재고를 수정할까요?")
            }
            else {
                makeStrawberryJuice()
            }
        case bananaJuice:
            if banana.stock < 2 {
                //alert으로 수정예정
                print("재료가 모자라요. 재고를 수정할까요?")
            }
            else {
                makeBananaJuice()
            }
        case strawberryBananaJuice:
            if strawberry.stock < 10 || banana.stock < 1 {
                //alert으로 수정예정
                print("재료가 모자라요. 재고를 수정할까요?")
            }
            else {
                makeStrawberryBananaJuice()
            }
        case pineappleJuice:
            if pineapple.stock < 2 {
                //alert으로 수정예정
                print("재료가 모자라요. 재고를 수정할까요?")
            }
            else {
                makePineappleJuice()
            }
        case kiwiJuice:
            if kiwi.stock < 2 {
                //alert으로 수정예정
                print("재료가 모자라요. 재고를 수정할까요?")
            }
            else {
                makeKiwiJuice()
            }
        case mangoJuice:
            if mango.stock < 3 {
                //alert으로 수정예정
                print("재료가 모자라요. 재고를 수정할까요?")
            }
            else {
                makeMangoJuice()
            }
        case mangoKiwiJuice:
            if mango.stock < 2 || kiwi.stock < 1 {
                //alert으로 수정예정
                print("재료가 모자라요. 재고를 수정할까요?")
            }
            else {
                makeMangoKiwiJuice()
            }
        default:
            print("에러입니다.")
        }
    }

    func makeStrawberryJuice() {
        //alert으로 수정예정
        print("딸기 쥬스 나왔습니다! 맛있게 드세요!")
        strawberry.stock -= 16
    }

    func makeBananaJuice() {
        //alert으로 수정예정
        print("바나나 쥬스 나왔습니다! 맛있게 드세요!")
        banana.stock -= 2
        
    }

    func makeStrawberryBananaJuice() {
        //alert으로 수정예정
        print("딸바 쥬스 나왔습니다! 맛있게 드세요!")
        strawberry.stock -= 10
        banana.stock -= 1
    }

    func makePineappleJuice() {
        //alert으로 수정예정
        print("파인애플 쥬스 나왔습니다! 맛있게 드세요!")
        pineapple.stock -= 2
    }

    func makeKiwiJuice() {
        //alert으로 수정예정
        print("키위 쥬스 나왔습니다! 맛있게 드세요!")
        kiwi.stock -= 2
    }

    func makeMangoJuice() {
        //alert으로 수정예정
        print("망고 쥬스 나왔습니다! 맛있게 드세요!")
        mango.stock -= 3
    }

    func makeMangoKiwiJuice() {
        //alert으로 수정예정
        print("망키 쥬스 나왔습니다! 맛있게 드세요!")
        mango.stock -= 2
        kiwi.stock -= 1
    }
}
