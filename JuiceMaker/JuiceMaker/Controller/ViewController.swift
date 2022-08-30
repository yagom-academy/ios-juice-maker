import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a = JuiceMaker()
        a.makeFruitJuice(.strawberryJuice)
        
    }
}

