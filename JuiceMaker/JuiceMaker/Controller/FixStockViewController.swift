
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
    
    var fruitStore: FruitStore?
    weak var delegate: FixStockViewControllerDelegate?
    
    @IBAction func strawberryStepperValueChanged(_ sender: UIStepper) {
        guard let fruit = fruitStore?.strawberry else {
            return
        }
        tryStepper(fruit: fruit, sender: sender)
        strawberryLabel.text = fruitStore?.strawberry.stock.description
    }
    @IBAction func bananaStepperValueChanged(_ sender: UIStepper) {
        guard let fruit = fruitStore?.banana else {
            return
        }
        tryStepper(fruit: fruit, sender: sender)
        bananaLabel.text = fruitStore?.banana.stock.description
    }
    @IBAction func pineappleStepperValueChanged(_ sender: UIStepper) {
        guard let fruit = fruitStore?.pineapple else {
            return
        }
        tryStepper(fruit: fruit, sender: sender)
        pineappleLabel.text = fruitStore?.pineapple.stock.description
    }
    @IBAction func kiwiStepperValueChanged(_ sender: UIStepper) {
        guard let fruit = fruitStore?.kiwi else {
            return
        }
        tryStepper(fruit: fruit, sender: sender)
        kiwiLabel.text = fruitStore?.kiwi.stock.description
    }
    @IBAction func mangoStepperValueChanged(_ sender: UIStepper) {
        guard let fruit = fruitStore?.mango else {
            return
        }
        tryStepper(fruit: fruit, sender: sender)
        mangoLabel.text = fruitStore?.mango.stock.description
    }
    
    private func tryStepper(fruit: Fruit, sender: UIStepper) {
        do {
            if sender.value < 0 {
                try fruitStore?.decreaseStock(fruit: fruit)
            } else {
                try fruitStore?.increaseStock(fruit: fruit)
            }
            sender.value = 0
        } catch {
            sender.value = 0
        }
    }
    
    @IBAction func closeButton(_ sender: UIBarButtonItem) {
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
        strawberryLabel.text = String(fruitStore?.strawberry.stock ?? 0)
        bananaLabel.text = String(fruitStore?.banana.stock ?? 0)
        pineappleLabel.text = String(fruitStore?.pineapple.stock ?? 0)
        kiwiLabel.text = String(fruitStore?.kiwi.stock ?? 0)
        mangoLabel.text = String(fruitStore?.mango.stock ?? 0)
        
        setUpStepper(stepper: strawberryStepper)
        setUpStepper(stepper: bananaStepper)
        setUpStepper(stepper: kiwiStepper)
        setUpStepper(stepper: pineappleStepper)
        setUpStepper(stepper: mangoStepper)
        
        strawberryStepper.minimumValue -= Double(fruitStore?.strawberry.stock ?? Int.min)
        bananaStepper.minimumValue -= Double(fruitStore?.banana.stock ?? Int.min)
        pineappleStepper.minimumValue -= Double(fruitStore?.pineapple.stock ?? Int.min)
        kiwiStepper.minimumValue -= Double(fruitStore?.kiwi.stock ?? Int.min)
        mangoStepper.minimumValue -= Double(fruitStore?.mango.stock ?? Int.min)
    }
    
    func setUpStepper(stepper: UIStepper) {
        stepper.wraps = false
        stepper.autorepeat = true
    }
}
