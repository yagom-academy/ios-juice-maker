import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var juiceMaker = JuiceMaker()
        juiceMaker.handleMakeFruitJuiceError(fruitJuice: .strawberryJuice)
        juiceMaker.handleMakeFruitJuiceError(fruitJuice: .strawberryBananaJuice)
        juiceMaker.handleMakeFruitJuiceError(fruitJuice: .strawberryJuice)
        juiceMaker.handleMakeFruitJuiceError(fruitJuice: .strawberryBananaJuice)
    }
}

