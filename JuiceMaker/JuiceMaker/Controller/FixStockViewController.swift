
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
        guard let stock = strawberryLabel.text, let num = Int(stock), num >= 0 else {
            print(JuiceMakerError.insufficientFruit)
            return
        }
        fruitStore.strawberry.stock = num
        guard let stock = bananaLabel.text, let num = Int(stock), num >= 0 else {
            print(JuiceMakerError.insufficientFruit)
            return
        }
        fruitStore.banana.stock = num
        guard let stock = pineappleLabel.text, let num = Int(stock), num >= 0 else {
            print(JuiceMakerError.insufficientFruit)
            return
        }
        fruitStore.pineapple.stock = num
        guard let stock = kiwiLabel.text, let num = Int(stock), num >= 0 else {
            print(JuiceMakerError.insufficientFruit)
            return
        }
        fruitStore.kiwi.stock = num
        guard let stock = mangoLabel.text, let num = Int(stock), num >= 0 else {
            print(JuiceMakerError.insufficientFruit)
            return
        }
        fruitStore.mango.stock = num
        
        //fruitStore.strawberry.stock = textToInt(text: strawberryLabel.text)
        delegate?.dataReload()
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
        bananaStepper.wraps = false
        bananaStepper.autorepeat = true
        bananaStepper.minimumValue = Double(Int.min)
        kiwiStepper.wraps = false
        kiwiStepper.autorepeat = true
        kiwiStepper.minimumValue = Double(Int.min)
        pineappleStepper.wraps = false
        pineappleStepper.autorepeat = true
        pineappleStepper.minimumValue = Double(Int.min)
        mangoStepper.wraps = false
        mangoStepper.autorepeat = true
        mangoStepper.minimumValue = Double(Int.min)
    }
}
