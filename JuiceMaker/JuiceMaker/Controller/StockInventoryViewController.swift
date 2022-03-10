import UIKit

class StockInventoryViewController: UIViewController {
    var fruitStockStatus: [FruitType: Int] = [:]
    let minimumNumberOfStock: Double = 0
    weak var delegate: JuiceOrderViewControllerDelegate?
    
    @IBOutlet private weak var stockOfStrawberryLabel: UILabel!
    @IBOutlet private weak var stockOfBananaLabel: UILabel!
    @IBOutlet private weak var stockOfPineappleLabel: UILabel!
    @IBOutlet private weak var stockOfKiwiLabel: UILabel!
    @IBOutlet private weak var stockOfMangoLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    @IBOutlet var stockSteppers: [UIStepper]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFruitStockLabel()
        setupFruitStockStepper()
    }
    
    private func setupFruitStockLabel() {
        stockOfStrawberryLabel.text = String(fruitStockStatus[FruitType.strawberry] ?? Int.zero)
        stockOfBananaLabel.text = String(fruitStockStatus[FruitType.banana] ?? Int.zero)
        stockOfPineappleLabel.text = String(fruitStockStatus[FruitType.pineapple] ?? Int.zero)
        stockOfKiwiLabel.text = String(fruitStockStatus[FruitType.kiwi] ?? Int.zero)
        stockOfMangoLabel.text = String(fruitStockStatus[FruitType.mango] ?? Int.zero)
    }
    
    private func setupFruitStockStepper() {
        setupFruitStockStepperOption()
        setupFruitStockStepperLabel()
    }
    
    private func setupFruitStockStepperOption() {
        stockSteppers.forEach({
            $0.autorepeat = true
            $0.minimumValue = minimumNumberOfStock
        })
    }
    
    private func setupFruitStockStepperLabel() {
        strawberryStepper.value = Double(fruitStockStatus[FruitType.strawberry] ?? Int.zero)
        bananaStepper.value = Double(fruitStockStatus[FruitType.banana] ?? Int.zero)
        pineappleStepper.value = Double(fruitStockStatus[FruitType.pineapple] ?? Int.zero)
        kiwiStepper.value = Double(fruitStockStatus[FruitType.kiwi] ?? Int.zero)
        mangoStepper.value = Double(fruitStockStatus[FruitType.mango] ?? Int.zero)
    }
    
    @IBAction private func stepperValueChangedAction(_ sender: UIStepper) {
        switch sender {
        case strawberryStepper:
            stockOfStrawberryLabel.text = Int(sender.value).description
        case bananaStepper:
            stockOfBananaLabel.text = Int(sender.value).description
        case pineappleStepper:
            stockOfPineappleLabel.text = Int(sender.value).description
        case kiwiStepper:
            stockOfKiwiLabel.text = Int(sender.value).description
        case mangoStepper:
            stockOfMangoLabel.text = Int(sender.value).description
        default:
            return
        }
    }
    
    private func changedFruitsStock() -> [FruitType: Int] {
        var fruits: [FruitType: Int] = [:]
        fruits.updateValue(Int(strawberryStepper.value), forKey: FruitType.strawberry)
        fruits.updateValue(Int(bananaStepper.value), forKey: FruitType.banana)
        fruits.updateValue(Int(pineappleStepper.value), forKey: FruitType.pineapple)
        fruits.updateValue(Int(kiwiStepper.value), forKey: FruitType.kiwi)
        fruits.updateValue(Int(mangoStepper.value), forKey: FruitType.mango)
        return fruits
    }
    
    @IBAction private func closeManageStockView(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.JuiceOrderViewControllerHasChanges(changedFruitsStock())
    }
}
