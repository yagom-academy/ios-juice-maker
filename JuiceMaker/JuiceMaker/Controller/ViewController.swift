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
        
        망고주스()
    }
    
    func 딸기주스버튼() {
        juiceMaker?.makeJuice(juiceMenu: [JuiceMenu.recipe(.strawberry, 16)])
    }
    
    func 바나나주스버튼() {
        juiceMaker?.makeJuice(juiceMenu: [JuiceMenu.recipe(.banana, 3)])
    }
    
    func 파인애플주스버튼() {
        juiceMaker?.makeJuice(juiceMenu: [JuiceMenu.recipe(.pineapple, 2)])
    }
    
    func 키위주스() {
        juiceMaker?.makeJuice(juiceMenu: [JuiceMenu.recipe(.kiwi, 3)])
    }
    
    func 망고주스() {
        juiceMaker?.makeJuice(juiceMenu: [JuiceMenu.recipe(.mango, 3)])
    }
    
    func 딸기바나나주스() {
        juiceMaker?.makeJuice(juiceMenu: [JuiceMenu.recipe(.strawberry, 10), JuiceMenu.recipe(.banana, 1)])
    }

    func 망고키위주스() {
        juiceMaker?.makeJuice(juiceMenu: [JuiceMenu.recipe(.mango, 2), JuiceMenu.recipe(.kiwi, 1)])
    }
}
