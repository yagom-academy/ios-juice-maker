//그린

import UIKit

class CreditViewController: ViewController {

    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    var strawberryQuantity: Int = 0
    var bananaQuantity: Int = 0
    var pineappleQuantity: Int = 0
    var kiwiQuantity: Int = 0
    var mangoQuantity: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        strawberryStock.text = String(strawberryQuantity)
        bananaStock.text = String(bananaQuantity)
        pineappleStock.text = String(pineappleQuantity)
        kiwiStock.text = String(kiwiQuantity)
        mangoStock.text = String(mangoQuantity)
    }
    
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        dismiss(animated: true,
                completion: nil)
    }

    @IBAction func strawberryAdjust(_ sender: UIStepper) {
        let strawberry: Int = strawberryQuantity + Int(sender.value)
        strawberryStock.text = String(strawberry)
    }
    
    
    @IBAction func bananaAdjust(_ sender: UIStepper) {
        let banana: Int = bananaQuantity + Int(sender.value)
        bananaStock.text = String(banana)
    }
    
    
    @IBAction func pineappleAdjust(_ sender: UIStepper) {
        let pineapple: Int = pineappleQuantity + Int(sender.value)
        pineappleStock.text = String(pineapple)
    }
    
    @IBAction func kiwiAdjust(_ sender: UIStepper) {
        let kiwi: Int = kiwiQuantity + Int(sender.value)
        kiwiStock.text = String(kiwi)
    }
    
    @IBAction func mangoAdjust(_ sender: UIStepper) {
        let mango: Int = mangoQuantity + Int(sender.value)
        mangoStock.text = String(mango)
    }
    
}
