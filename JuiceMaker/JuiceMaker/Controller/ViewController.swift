import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var juiceMaker = JuiceMaker()
        juiceMaker.takeAnOrder(fruitJuice: .strawberryJuice)
        juiceMaker.takeAnOrder(fruitJuice: .strawberryBananaJuice)
        juiceMaker.takeAnOrder(fruitJuice: .strawberryJuice)
        juiceMaker.takeAnOrder(fruitJuice: .strawberryBananaJuice)
    }
}

