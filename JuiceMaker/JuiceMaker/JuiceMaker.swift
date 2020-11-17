import Foundation

class JuiceMaker {
    private var numberOfStrawberry = 0
    private var numberOfBanana = 0
    private var numberOfPineapple = 0
    private var numberOfKiwi = 0
    private var numberOfMango = 0
    
    init() {
        let initialSupplement = 10
        numberOfStrawberry = initialSupplement
        numberOfBanana = initialSupplement
        numberOfPineapple = initialSupplement
        numberOfKiwi = initialSupplement
        numberOfMango = initialSupplement
    }
    
    var currentNumberOfStrawberry: Int {
        numberOfStrawberry
    }
    
    var currentNumberOfBanana: Int {
        numberOfBanana
    }
    
    var currentNumberOfPineapple: Int {
        numberOfPineapple
    }
    
    var currentNumberOfKiwi: Int {
        numberOfKiwi
    }
    
    var currentNumberOfMango: Int {
        numberOfMango
    }
    
    func supplyStrawberry(amountOf strawberry: Int) {
        numberOfStrawberry += strawberry
    }
    
    func supplyBanana(amountOf banana: Int) {
        numberOfBanana += banana
    }
    
    func supplyPineapple(amountOf pineapple: Int) {
        numberOfPineapple += pineapple
    }
    
    func supplyKiwi(amountOf kiwi: Int) {
        numberOfKiwi += kiwi
    }
    
    func supplyMango(amountOf mango: Int) {
        numberOfMango += mango
    }
    
    func makeStrawberryJuice() {
        numberOfStrawberry -= 3
    }
    
    func makeBananaJuice() {
        numberOfBanana -= 3
    }
    
    func makePineappleJuice() {
        numberOfPineapple -= 2
    }
    
    func makeKiwiJuice() {
        numberOfKiwi -= 3
    }
    
    func makeMangoJuice() {
        numberOfMango -= 3
    }
    
    func makeStrawberryBananaJuice() {
        numberOfStrawberry -= 10
        numberOfBanana -= 1
    }
    
    func makeMangoKiwiJuice() {
        numberOfMango -= 2
        numberOfKiwi -= 1
    }
}
