struct Fruits {
    var strawberry: Int
    var banana: Int
    var kiwi: Int
    var pineapple: Int
    var mango: Int
    
    init(strawberry: Int = 0, banana: Int = 0, kiwi: Int = 0, pineapple: Int = 0, mango: Int = 0) {
        self.strawberry = strawberry
        self.banana = banana
        self.kiwi = kiwi
        self.pineapple = pineapple
        self.mango = mango
    }
    
    init(stock: Int) {
        self.strawberry = stock
        self.banana = stock
        self.kiwi = stock
        self.pineapple = stock
        self.mango = stock
    }
}
