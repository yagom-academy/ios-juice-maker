import UIKit

class ModifyFruitsStockViewController: UIViewController {
    
    @IBOutlet weak private var strawberryCountLabel: UILabel!
    @IBOutlet weak private var bananaCountLabel: UILabel!
    @IBOutlet weak private var pineappleCountLabel: UILabel!
    @IBOutlet weak private var kiwiCountLabel: UILabel!
    @IBOutlet weak private var mangoCountLabel: UILabel!
    @IBOutlet weak private var strawberryStepper: UIStepper!
    @IBOutlet weak private var bananaStepper: UIStepper!
    @IBOutlet weak private var pineappleStepper: UIStepper!
    @IBOutlet weak private var kiwiStepper: UIStepper!
    @IBOutlet weak private var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateAllFruitsCount()
    }
    
    private func updateAllFruitsCount() {
        let fruitList = JuiceMaker.shared.fruitList
        fruitList.forEach { fruit, count in
            updateCountLabel(fruit: fruit, count: count)
        }
    }
    
    private func updateCountLabel(fruit: Fruits, count: Int) {
        switch fruit {
        case .strawberry:
            strawberryCountLabel.text = String(count)
            strawberryStepper.value = Double(count)
        case .banana:
            bananaCountLabel.text = String(count)
            bananaStepper.value = Double(count)
        case .pineapple:
            pineappleCountLabel.text = String(count)
            pineappleStepper.value = Double(count)
        case .kiwi:
            kiwiCountLabel.text = String(count)
            kiwiStepper.value = Double(count)
        case .mango:
            mangoCountLabel.text = String(count)
            mangoStepper.value = Double(count)
        }
    }
    
    @IBAction private func touchUpDismissButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction private func touchUpStepper(sender: UIStepper) {
        let count = Int(sender.value)
        
        switch sender {
        case strawberryStepper:
            strawberryCountLabel.text = String(count)
            JuiceMaker.shared.requestModifyFruitCount(fruit: .strawberry, count: count)
        case bananaStepper:
            bananaCountLabel.text = String(count)
            JuiceMaker.shared.requestModifyFruitCount(fruit: .banana, count: count)
        case pineappleStepper:
            pineappleCountLabel.text = String(count)
            JuiceMaker.shared.requestModifyFruitCount(fruit: .pineapple, count: count)
        case kiwiStepper:
            kiwiCountLabel.text = String(count)
            JuiceMaker.shared.requestModifyFruitCount(fruit: .kiwi, count: count)
        case mangoStepper:
            mangoCountLabel.text = String(count)
            JuiceMaker.shared.requestModifyFruitCount(fruit: .mango, count: count)
        default:
            return
        }
    }
}
