import UIKit

class ViewController: UIViewController {
    let fruitStore: FruitStore = FruitStore(fruit: [.strawberry: 10,
                                                   .banana: 10,
                                                   .pineapple: 10,
                                                   .kiwi: 10,
                                                   .mango: 10])
    var juiceMaker: JuiceMaker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.juiceMaker = JuiceMaker(fruitStore: fruitStore)
    }
}
