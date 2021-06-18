
import UIKit

protocol FixStockViewControllerDelegate: class {
    func fixStockViewControllerDidTapCloseButton(_ fixStockVC: FixStockViewController)
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
        tryStepper(fruit: fruitStore.strawberry, sender: sender)
        strawberryLabel.text = fruitStore.strawberry.stock.description
    }
    @IBAction func bananaStepperValueChanged(_ sender: UIStepper) {
        tryStepper(fruit: fruitStore.banana, sender: sender)
        bananaLabel.text = fruitStore.banana.stock.description
    }
    @IBAction func pineappleStepperValueChanged(_ sender: UIStepper) {
        tryStepper(fruit: fruitStore.pineapple, sender: sender)
        pineappleLabel.text = fruitStore.pineapple.stock.description
    }
    @IBAction func kiwiStepperValueChanged(_ sender: UIStepper) {
        tryStepper(fruit: fruitStore.kiwi, sender: sender)
        kiwiLabel.text = fruitStore.kiwi.stock.description
    }
    @IBAction func mangoStepperValueChanged(_ sender: UIStepper) {
        tryStepper(fruit: fruitStore.mango, sender: sender)
        mangoLabel.text = fruitStore.mango.stock.description
    }
    
    private func tryStepper(fruit: Fruit, sender: UIStepper) {
        do {
            if sender.value < 0 {
                try fruitStore.decreaseStock(fruit: fruit)
            } else {
                try fruitStore.increaseStock(fruit: fruit)
            }
            sender.value = 0
        } catch {
            sender.value = 0
            showAlert(message: .unexpectedError)
        }
    }
    
    @IBAction func closeButton(_ sender: UIBarButtonItem) {
        do {
            try fruitStore.banana.stock = typeChange(of: bananaLabel.text)
            try fruitStore.pineapple.stock = typeChange(of: pineappleLabel.text)
            try fruitStore.kiwi.stock = typeChange(of: kiwiLabel.text)
            try fruitStore.mango.stock = typeChange(of: mangoLabel.text)
        } catch {
            showAlert(message: .unexpectedError)
        }
        delegate?.fixStockViewControllerDidTapCloseButton(self)
        dismiss(animated: true, completion: nil)
    }
    
    func showAlert(message: JuiceMakerError){
        let alert = UIAlertController(title: nil, message: message.description, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "예", style: .cancel)
        
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func typeChange(of stockInString: String?) throws -> Int {
        guard let stock = stockInString, let stockInInt = Int(stock) else {
            throw JuiceMakerError.unexpectedError
        }
        return stockInInt
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
