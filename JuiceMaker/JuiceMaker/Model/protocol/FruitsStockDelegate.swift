protocol FruitsStockDelegate: AnyObject{
    func updateFruitsStock(_ fruitStocks: [Fruit: Int])
}
