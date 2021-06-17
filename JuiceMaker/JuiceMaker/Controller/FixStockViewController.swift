
import UIKit

protocol FixStockViewControllerDelegate: class {
    func fixStockViewController()
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
    weak var delegate: FixStockViewControllerDelegate?
     
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
        typeChange(of: strawberryLabel.text)
        typeChange(of: bananaLabel.text)
        typeChange(of: pineappleLabel.text)
        typeChange(of: kiwiLabel.text)
        typeChange(of: mangoLabel.text)
        delegate?.fixStockViewController()
        dismiss(animated: true, completion: nil)
    }

    func typeChange(of stockInString: String?) {
            guard let stock = stockInString, let stockInInt = Int(stock) else {
                print(JuiceMakerError.unexpectedError)
                return
            }
            switch stockInString {
            case strawberryLabel.text:
                fruitStore.strawberry.stock = stockInInt
            case bananaLabel.text:
                fruitStore.banana.stock = stockInInt
            case pineappleLabel.text:
                fruitStore.pineapple.stock = stockInInt
            case kiwiLabel.text:
                fruitStore.kiwi.stock = stockInInt
            default:
                fruitStore.mango.stock = stockInInt
            }
        }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            strawberryLabel.text = String(fruitStore.strawberry.stock)
            bananaLabel.text = String(fruitStore.banana.stock)
            pineappleLabel.text = String(fruitStore.pineapple.stock)
            kiwiLabel.text = String(fruitStore.kiwi.stock)
            mangoLabel.text = String(fruitStore.mango.stock)

            setUpStepper(stepper: strawberryStepper)
            setUpStepper(stepper: bananaStepper)
            setUpStepper(stepper: kiwiStepper)
            setUpStepper(stepper: pineappleStepper)
            setUpStepper(stepper: mangoStepper)

            strawberryStepper.minimumValue -= Double(fruitStore.strawberry.stock)
            bananaStepper.minimumValue -= Double(fruitStore.banana.stock)
            pineappleStepper.minimumValue -= Double(fruitStore.pineapple.stock)
            kiwiStepper.minimumValue -= Double(fruitStore.kiwi.stock)
            mangoStepper.minimumValue -= Double(fruitStore.mango.stock)
        }
    
        func setUpStepper(stepper: UIStepper) {
            stepper.wraps = false
            stepper.autorepeat = true
        }
}
