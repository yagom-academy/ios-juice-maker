
import UIKit

class FixStockViewController: UIViewController {
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
   
    var fruitStore = FruitStore()
     
    @IBAction func strawberryStepperValueChanged(_ sender: UIStepper) {
        strawberryLabel.text = Int(sender.value).description
    }
    @IBAction func bananaStepperValueChanged(_ sender: UIStepper) {
    }
    @IBAction func pineappleStepperValueChanged(_ sender: UIStepper) {
    }
    @IBAction func kiwiStepperValueChanged(_ sender: UIStepper) {
    }
    @IBAction func mangoStepperValueChanged(_ sender: UIStepper) {
    }
    
    
    @IBAction func closeButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        strawberryLabel.text = String(fruitStore.strawberry.stock)
        bananaLabel.text = String(fruitStore.banana.stock)
        pineappleLabel.text = String(fruitStore.pineapple.stock)
        kiwiLabel.text = String(fruitStore.kiwi.stock)
        mangoLabel.text = String(fruitStore.mango.stock)
        
        strawberryStepper.wraps = false
        strawberryStepper.autorepeat = true
    }
}
