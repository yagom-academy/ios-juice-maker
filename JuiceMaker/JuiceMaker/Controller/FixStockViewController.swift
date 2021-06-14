
import UIKit

protocol FixStockViewDelegate {
    func fixStockView(stock: String)
}

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
    var delegate: FixStockViewDelegate?
     
    @IBAction func strawberryStepperValueChanged(_ sender: UIStepper) {
        strawberryLabel.text = (fruitStore.strawberry.stock + Int(sender.value)).description
    }
    @IBAction func bananaStepperValueChanged(_ sender: UIStepper) {
    }
    @IBAction func pineappleStepperValueChanged(_ sender: UIStepper) {
    }
    @IBAction func kiwiStepperValueChanged(_ sender: UIStepper) {
    }
    @IBAction func mangoStepperValueChanged(_ sender: UIStepper) {
    }
    
    func textToInt(text: String?) -> Int {
        guard let text = text else {
            return 0
        }
        guard let number = Int(text) else {
            return 0
        }
        return number
    }
    
    @IBAction func closeButton(_ sender: UIBarButtonItem) {
        guard let stock = strawberryLabel.text, let number = Int(stock), number >= 0 else {
            print(JuiceMakerError.insufficientFruit)
            return
        }
        fruitStore.strawberry.stock = number
        delegate?.fixStockView(stock: fruitStore.strawberry.stock.description)
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
        strawberryStepper.minimumValue = Double(Int.min)
    }
}
