import Foundation

class Fruit {
    let name : String
    var stock : Int
    
    init(name : String, stock : Int) {
        self.name = name
        self.stock = stock
    }
}

let initialValue : Int = 10

var strawberry : Fruit = Fruit(name : "strawberry", stock: initialValue)
var banana : Fruit = Fruit(name : "banana", stock: initialValue)
var pineapple : Fruit = Fruit(name : "pineapple", stock: initialValue)
var kiwi : Fruit = Fruit(name : "kiwi", stock: initialValue)
var mango : Fruit = Fruit(name : "mango", stock: initialValue)

//보기전용 값으로 사용자에게 보여줄 때만 사용되는 변수
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

class JuiceMaker {
    func vetifyStock(whichFruitJuice: String) -> Bool{
        switch whichFruitJuice {
        case "strawberryJuice":
            if strawberry.stock < 16 {
                //alert으로 수정예정
                print("재료가 모자라요. 재고를 수정할까요?")
                return false
            }
            else {
                return true
            }
        case "bananaJuice":
            if banana.stock < 2 {
                //alert으로 수정예정
                print("재료가 모자라요. 재고를 수정할까요?")
                return false
            }
            else {
                return true
            }
        case "strawberryBananaJuice":
            if strawberry.stock < 10 || banana.stock < 1 {
                //alert으로 수정예정
                print("재료가 모자라요. 재고를 수정할까요?")
                return false
            }
            else {
                return true
            }
        case "pineappleJuice":
            if pineapple.stock < 2 {
                //alert으로 수정예정
                print("재료가 모자라요. 재고를 수정할까요?")
                return false
            }
            else {
                return true
            }
        case "kiwiJuice":
            if kiwi.stock < 2 {
                //alert으로 수정예정
                print("재료가 모자라요. 재고를 수정할까요?")
                return false
            }
            else {
                return true
            }
        case "mangoJuice":
            if mango.stock < 3 {
                //alert으로 수정예정
                print("재료가 모자라요. 재고를 수정할까요?")
                return false
            }
            else {
                return true
            }
        case "mangoKiwiJuice":
            if mango.stock < 2 || kiwi.stock < 1 {
                //alert으로 수정예정
                print("재료가 모자라요. 재고를 수정할까요?")
                return false
            }
            else {
                return true
            }
        default:
            print("에러입니다.")
            return false
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
