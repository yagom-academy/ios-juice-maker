import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var a = JuiceMaker()
        a.handleMakeFruitJuiceError(fruitJuice: .strawberryJuice)
        a.handleMakeFruitJuiceError(fruitJuice: .strawberryBananaJuice)
        
    }
}

