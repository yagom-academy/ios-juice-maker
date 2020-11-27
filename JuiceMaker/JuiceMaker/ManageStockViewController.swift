//그린
//쥬스 재고관리

import UIKit

class ManageStockViewController: ViewController {
    
    var strawberryStock: UInt = 10
    var bananaStock: UInt = 10
    var pineappleStock: UInt = 10
    var kiwiStock: UInt = 10
    var mangoStock: UInt = 10
    
    @IBOutlet weak var numberOfStrawberry: UILabel!
    @IBOutlet weak var numberOfBanana: UILabel!
    @IBOutlet weak var numberOfPineapple: UILabel!
    @IBOutlet weak var numberOfKiwi: UILabel!
    @IBOutlet weak var numberOfMango: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showFruitStock()
    }
    
    func showFruitStock() {
        numberOfStrawberry.text = String(strawberryStock)
        numberOfBanana.text = String(bananaStock)
        numberOfPineapple.text = String(pineappleStock)
        numberOfKiwi.text = String(kiwiStock)
        numberOfMango.text = String(mangoStock)
    }
    
    @IBAction func touchupDissmissButton(_ sender: UIButton) {
        dismiss(animated: true,
                completion: nil)
    }
}
