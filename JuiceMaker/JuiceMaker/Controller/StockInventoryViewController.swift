import UIKit

class StockInventoryViewController: UIViewController {
    var fruitStockStatus: [FruitType: Int] = [:]
    let minimumNumberOfStock: Double = 0
    var dataDelegate: dataDelegate?
    
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
        stockOfStrawberryLabel.text = String(fruitStockStatus[FruitType.strawberry] ?? 0)
        stockOfBananaLabel.text = String(fruitStockStatus[FruitType.banana] ?? 0)
        stockOfPineappleLabel.text = String(fruitStockStatus[FruitType.pineapple] ?? 0)
        stockOfKiwiLabel.text = String(fruitStockStatus[FruitType.kiwi] ?? 0)
        stockOfMangoLabel.text = String(fruitStockStatus[FruitType.mango] ?? 0)
    }
    
    func setupFruitStockStepper() {
        setupFruitStockStepperOption()
        setupFruitStockStepperLabel()
    }
    
    func setupFruitStockStepperOption() {
        stockSteppers.forEach({
            $0.autorepeat = true
            $0.minimumValue = minimumNumberOfStock
        })
    }
    
    func setupFruitStockStepperLabel() {
        strawberryStepper.value = Double(fruitStockStatus[FruitType.strawberry] ?? 0)
        bananaStepper.value = Double(fruitStockStatus[FruitType.banana] ?? 0)
        pineappleStepper.value = Double(fruitStockStatus[FruitType.pineapple] ?? 0)
        kiwiStepper.value = Double(fruitStockStatus[FruitType.kiwi] ?? 0)
        mangoStepper.value = Double(fruitStockStatus[FruitType.mango] ?? 0)
    }
    
    @IBAction func stepperValueChangedAction(_ sender: UIStepper) {
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
    
    func changedFruitsStock() -> [FruitType: Int] {
        var fruits: [FruitType: Int] = [:]
        if isStockChanged(fruit: FruitType.strawberry, currentStock: Int(strawberryStepper.value)) {
            fruits.updateValue(Int(strawberryStepper.value), forKey: FruitType.strawberry)
        }
        if isStockChanged(fruit: FruitType.banana, currentStock: Int(bananaStepper.value)) {
            fruits.updateValue(Int(bananaStepper.value), forKey: FruitType.banana)
        }
        if isStockChanged(fruit: FruitType.pineapple, currentStock: Int(pineappleStepper.value)) {
            fruits.updateValue(Int(pineappleStepper.value), forKey: FruitType.pineapple)
        }
        if isStockChanged(fruit: FruitType.kiwi, currentStock: Int(kiwiStepper.value)) {
            fruits.updateValue(Int(kiwiStepper.value), forKey: FruitType.kiwi)
        }
        if isStockChanged(fruit: FruitType.mango, currentStock: Int(mangoStepper.value)) {
            fruits.updateValue(Int(mangoStepper.value), forKey: FruitType.mango)
        }
        return fruits
    }
    
    func isStockChanged(fruit: FruitType, currentStock: Int) -> Bool {
        return currentStock != fruitStockStatus[fruit]
    }
    
    @IBAction func closeManageStockView(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dataDelegate?.sendData(fruits: changedFruitsStock())
    }
}
