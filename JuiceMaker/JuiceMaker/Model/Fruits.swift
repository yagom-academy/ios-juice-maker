struct Fruits {
    private var strawberry: Int
    private var banana: Int
    private var kiwi: Int
    private var pineapple: Int
    private var mango: Int
    
    init(strawberry: Int = 0, banana: Int = 0, kiwi: Int = 0, pineapple: Int = 0, mango: Int = 0) {
        self.strawberry = strawberry
        self.banana = banana
        self.kiwi = kiwi
        self.pineapple = pineapple
        self.mango = mango
    }
    
    func hasEnoughFruits(toMake recipe: Fruits) -> Bool {
        return (strawberry >= recipe.strawberry
                && banana >= recipe.banana
                && kiwi >= recipe.kiwi
                && pineapple >= recipe.pineapple
                && mango >= recipe.mango)
    }
    
    mutating func useFruits(toMake recipe: Fruits) {
        strawberry -= recipe.strawberry
        banana -= recipe.banana
        kiwi -= recipe.kiwi
        pineapple -= recipe.pineapple
        mango -= recipe.mango
    }
}
