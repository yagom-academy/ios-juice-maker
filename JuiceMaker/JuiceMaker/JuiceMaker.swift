import Foundation

class Fruit {
    let name : String
    var stock : Int
    
    init(name : String, stock : Int) {
        self.name = name
        self.stock = stock
    }
}

let fruitStockinitialValue : Int = 10

let strawberry : Fruit = Fruit(name : "strawberry", stock: fruitStockinitialValue)
let banana : Fruit = Fruit(name : "banana", stock: fruitStockinitialValue)
let pineapple : Fruit = Fruit(name : "pineapple", stock: fruitStockinitialValue)
let kiwi : Fruit = Fruit(name : "kiwi", stock: fruitStockinitialValue)
let mango : Fruit = Fruit(name : "mango", stock: fruitStockinitialValue)

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

enum FruitJuice {
    case strawberryJuice
    case bananaJuice
    case strawberryBananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case mangoKiwiJuice
}

class JuiceRecipe {
    let juiceName : String
    var needStock : Int
    
    init(juiceName : String, needStock : Int) {
        self.juiceName = juiceName
        self.needStock = needStock
    }
}

let needStrawberry : JuiceRecipe = JuiceRecipe(juiceName: "strawberryJuice", needStock: 16)
let needBanana : JuiceRecipe = JuiceRecipe(juiceName: "bananaJuice", needStock: 2)
let needStrawberryBananaToStrawberry : JuiceRecipe = JuiceRecipe(juiceName: "strawberryBananaJuice", needStock: 10)
let needStrawberryBananaToBanana : JuiceRecipe = JuiceRecipe(juiceName: "strawberryBananaJuice", needStock: 1)
let needPineapple : JuiceRecipe = JuiceRecipe(juiceName: "pineappleJuice", needStock: 2)
let needKiwi : JuiceRecipe = JuiceRecipe(juiceName: "kiwiJuice", needStock: 2)
let needMango : JuiceRecipe = JuiceRecipe(juiceName: "mangoJuice", needStock: 3)
let needMangoKiwiToMango : JuiceRecipe = JuiceRecipe(juiceName: "mangoJuice", needStock: 2)
let needMangoKiwiToKiwi : JuiceRecipe = JuiceRecipe(juiceName: "mangoJuice", needStock: 1)

class JuiceMaker {
    func vetifyStock(whichFruitJuice: FruitJuice) -> Bool{
        switch whichFruitJuice {
        case .strawberryJuice:
            if strawberry.stock < needStrawberry.needStock {
                //alert으로 수정예정
                print("재료가 모자라요. 재고를 수정할까요?")
                return false
            }
            else {
                return true
            }
        case .bananaJuice:
            if banana.stock < needBanana.needStock {
                //alert으로 수정예정
                print("재료가 모자라요. 재고를 수정할까요?")
                return false
            }
            else {
                return true
            }
        case .strawberryBananaJuice:
            if strawberry.stock < needStrawberryBananaToStrawberry.needStock || banana.stock < needStrawberryBananaToBanana.needStock {
                //alert으로 수정예정
                print("재료가 모자라요. 재고를 수정할까요?")
                return false
            }
            else {
                return true
            }
        case .pineappleJuice:
            if pineapple.stock < needPineapple.needStock {
                //alert으로 수정예정
                print("재료가 모자라요. 재고를 수정할까요?")
                return false
            }
            else {
                return true
            }
        case .kiwiJuice:
            if kiwi.stock < needKiwi.needStock {
                //alert으로 수정예정
                print("재료가 모자라요. 재고를 수정할까요?")
                return false
            }
            else {
                return true
            }
        case .mangoJuice:
            if mango.stock < needMango.needStock {
                //alert으로 수정예정
                print("재료가 모자라요. 재고를 수정할까요?")
                return false
            }
            else {
                return true
            }
        case .mangoKiwiJuice:
            if mango.stock < needMangoKiwiToMango.needStock || kiwi.stock < needMangoKiwiToKiwi.needStock {
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
        strawberry.stock -= needStrawberry.needStock
    }

    func makeBananaJuice() {
        //alert으로 수정예정
        print("바나나 쥬스 나왔습니다! 맛있게 드세요!")
        banana.stock -= needBanana.needStock
    }

    func makeStrawberryBananaJuice() {
        //alert으로 수정예정
        print("딸바 쥬스 나왔습니다! 맛있게 드세요!")
        strawberry.stock -= needStrawberryBananaToStrawberry.needStock
        banana.stock -= needStrawberryBananaToBanana.needStock
    }

    func makePineappleJuice() {
        //alert으로 수정예정
        print("파인애플 쥬스 나왔습니다! 맛있게 드세요!")
        pineapple.stock -= needPineapple.needStock
    }

    func makeKiwiJuice() {
        //alert으로 수정예정
        print("키위 쥬스 나왔습니다! 맛있게 드세요!")
        kiwi.stock -= needKiwi.needStock
    }

    func makeMangoJuice() {
        //alert으로 수정예정
        print("망고 쥬스 나왔습니다! 맛있게 드세요!")
        mango.stock -= needMango.needStock
    }

    func makeMangoKiwiJuice() {
        //alert으로 수정예정
        print("망키 쥬스 나왔습니다! 맛있게 드세요!")
        mango.stock -= needMangoKiwiToMango.needStock
        kiwi.stock -= needMangoKiwiToKiwi.needStock
    }
}
