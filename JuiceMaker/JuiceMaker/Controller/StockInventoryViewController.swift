import UIKit

class StockInventoryViewController: UIViewController {
    var fruitStore: FruitStore?
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
        guard let fruitStore = fruitStore else { return }
        stockOfStrawberryLabel.text = String(fruitStore.numberOfStock(fruit: FruitType.strawberry))
        stockOfBananaLabel.text = String(fruitStore.numberOfStock(fruit: FruitType.banana))
        stockOfPineappleLabel.text = String(fruitStore.numberOfStock(fruit: FruitType.pineapple))
        stockOfKiwiLabel.text = String(fruitStore.numberOfStock(fruit: FruitType.kiwi))
        stockOfMangoLabel.text = String(fruitStore.numberOfStock(fruit: FruitType.mango))
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
        guard let fruitStore = fruitStore else { return }
        strawberryStepper.value = Double(fruitStore.numberOfStock(fruit: FruitType.strawberry))
        bananaStepper.value = Double(fruitStore.numberOfStock(fruit: FruitType.banana))
        pineappleStepper.value = Double(fruitStore.numberOfStock(fruit: FruitType.pineapple))
        kiwiStepper.value = Double(fruitStore.numberOfStock(fruit: FruitType.kiwi))
        mangoStepper.value = Double(fruitStore.numberOfStock(fruit: FruitType.mango))
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
    
    private func changeFruitsStock() {
        fruitStore?.updateStock(fruit: FruitType.strawberry, amount: Int(strawberryStepper.value))
        fruitStore?.updateStock(fruit: FruitType.banana, amount: Int(bananaStepper.value))
        fruitStore?.updateStock(fruit: FruitType.pineapple, amount: Int(pineappleStepper.value))
        fruitStore?.updateStock(fruit: FruitType.kiwi, amount: Int(kiwiStepper.value))
        fruitStore?.updateStock(fruit: FruitType.mango, amount: Int(mangoStepper.value))
    }
    
    @IBAction private func closeManageStockView(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        changeFruitsStock()

        delegate?.JuiceOrderViewControllerHasChanges()
    }
}
