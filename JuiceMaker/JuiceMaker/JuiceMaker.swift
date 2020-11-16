//그린
// 쥬스 메이커 타입

import Foundation

class JuiceMaker {
    var strawberryStock: Int = 10
    var bananaStock: Int = 10
    var pineappleStock: Int = 10
    var kiwiStock: Int = 10
    var mangoStock: Int = 10
    
    func fruitStock() {
        var strawberry = strawberryStock
        var banana = bananaStock
        var pineapple = pineappleStock
        var kiwi = kiwiStock
        var mango = mangoStock
    }
    
    func makeJuice() {
        var strawberryJuice = strawberryStock - 3
        var bananaJuice = bananaStock - 3
        var kiwiJuice = kiwiStock - 3
        var pineappleJuice = pineappleStock - 2
        var mangoJuice = mangoStock - 3
        var strawberryBananaJuice = (strawberryStock - 10) + (bananaStock - 1)
        var mangoKiwiJuice = (mangoStock - 2) + (kiwiStock - 1)
    }
    
    func addFruitStock() {
        var addStrawberry = strawberryStock + 1
        var addBanana = bananaStock + 1
        var addPineapple = pineappleStock + 1
        var addKiwi = kiwiStock + 1
        var addMango = mangoStock + 1
    }
    
    func removeFruitStock() {
        var removeStrawberry = strawberryStock - 1
        var removeBanana = bananaStock - 1
        var removePineapple = pineappleStock - 1
        var removeKiwi = kiwiStock - 1
        var removeMango = mangoStock - 1
    }
}
