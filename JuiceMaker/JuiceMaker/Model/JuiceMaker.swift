class JuiceMaker {
    var fruitStore = FruitStore(fruitAmount: 50)
    
    func makeFruitJuice(_ fruitJuice: FruitJuice) {
        bringIngridients(of: fruitJuice)
    }
    
    func bringIngridients(of fruitJuice: FruitJuice) {
        let (fruit, amount) = fruitJuice.juiceIngridients.first
        fruitStore.subtractAmount(of: fruit, by: amount)
        
        if let (fruit, amount) = fruitJuice.juiceIngridients.second {
            fruitStore.subtractAmount(of: fruit, by: amount)
        }
    }
}
