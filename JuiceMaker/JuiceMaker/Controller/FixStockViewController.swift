
import UIKit

protocol sendBackDelegate {
    func dataReload()
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
    var delegate: sendBackDelegate?
     
    @IBAction func strawberryStepperValueChanged(_ sender: UIStepper) {
        strawberryLabel.text = (fruitStore.strawberry.stock + Int(sender.value)).description
    }
    @IBAction func bananaStepperValueChanged(_ sender: UIStepper) {
        bananaLabel.text = (fruitStore.banana.stock + Int(sender.value)).description
    }
    @IBAction func pineappleStepperValueChanged(_ sender: UIStepper) {
        pineappleLabel.text = (fruitStore.pineapple.stock + Int(sender.value)).description
    }
    @IBAction func kiwiStepperValueChanged(_ sender: UIStepper) {
        kiwiLabel.text = (fruitStore.kiwi.stock + Int(sender.value)).description
    }
    @IBAction func mangoStepperValueChanged(_ sender: UIStepper) {
        mangoLabel.text = (fruitStore.mango.stock + Int(sender.value)).description
    }
    
    @IBAction func closeButton(_ sender: UIBarButtonItem) {
        textToInt(text: strawberryLabel.text)
        textToInt(text: bananaLabel.text)
        textToInt(text: pineappleLabel.text)
        textToInt(text: kiwiLabel.text)
        textToInt(text: mangoLabel.text)
        delegate?.dataReload()
        dismiss(animated: true, completion: nil)
    }
    
    func textToInt(text: String?) {
        guard let stock = text, let num = Int(stock) else {
            print(JuiceMakerError.unexpectedError)
            return
        }
        switch text {
        case strawberryLabel.text:
            fruitStore.strawberry.stock = num
        case bananaLabel.text:
            fruitStore.banana.stock = num
        case pineappleLabel.text:
            fruitStore.pineapple.stock = num
        case kiwiLabel.text:
            fruitStore.kiwi.stock = num
        default:
            fruitStore.mango.stock = num
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        strawberryLabel.text = String(fruitStore.strawberry.stock)
        bananaLabel.text = String(fruitStore.banana.stock)
        pineappleLabel.text = String(fruitStore.pineapple.stock)
        kiwiLabel.text = String(fruitStore.kiwi.stock)
        mangoLabel.text = String(fruitStore.mango.stock)
        
        stepper(stepper: strawberryStepper)
        stepper(stepper: bananaStepper)
        stepper(stepper: kiwiStepper)
        stepper(stepper: pineappleStepper)
        stepper(stepper: mangoStepper)
        
        strawberryStepper.minimumValue -= Double(fruitStore.strawberry.stock)
        bananaStepper.minimumValue -= Double(fruitStore.banana.stock)
        pineappleStepper.minimumValue -= Double(fruitStore.pineapple.stock)
        kiwiStepper.minimumValue -= Double(fruitStore.kiwi.stock)
        mangoStepper.minimumValue -= Double(fruitStore.mango.stock)
        
        func stepper(stepper: UIStepper) {
            stepper.wraps = false
            stepper.autorepeat = true
        }
    }
}
