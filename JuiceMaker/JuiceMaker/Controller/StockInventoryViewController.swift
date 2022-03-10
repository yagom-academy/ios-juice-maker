import UIKit

class StockInventoryViewController: UIViewController {
    var fruitStore: FruitStore?
    let minimumNumberOfStock: Double = 0
    weak var delegate: JuiceOrderViewControllerDelegate?
    
    @IBOutlet private weak var stockOfStrawberryLabel: FruitLabel!
    @IBOutlet private weak var stockOfBananaLabel: FruitLabel!
    @IBOutlet private weak var stockOfPineappleLabel: FruitLabel!
    @IBOutlet private weak var stockOfKiwiLabel: FruitLabel!
    @IBOutlet private weak var stockOfMangoLabel: FruitLabel!
    
    @IBOutlet private weak var strawberryStepper: UIStepper!
    @IBOutlet private weak var bananaStepper: UIStepper!
    @IBOutlet private weak var pineappleStepper: UIStepper!
    @IBOutlet private weak var kiwiStepper: UIStepper!
    @IBOutlet private weak var mangoStepper: UIStepper!

    @IBOutlet var fruitLabels: [FruitLabel]!
    
    @IBOutlet private var stockSteppers: [UIStepper]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFruitLabelType()
        setupFruitStockLabel()
        setupFruitStockStepper()
    }
    
    private func setupFruitLabelType() {
        stockOfStrawberryLabel.fruitType = .strawberry
        stockOfBananaLabel.fruitType = .banana
        stockOfPineappleLabel.fruitType = .pineapple
        stockOfKiwiLabel.fruitType = .kiwi
        stockOfMangoLabel.fruitType = .mango
    }
    
    private func setupFruitStockLabel() {
        guard let fruitStore = fruitStore else { return }
        fruitLabels.forEach({
            guard let fruitType = $0.fruitType else { return }
            $0.text = String(fruitStore.numberOfStock(fruit: fruitType))
        })
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
//        switch sender {
//        case strawberryStepper:
//            guard let currentStock = fruitStore?.numberOfStock(fruit: FruitType.strawberry) else { return }
//            if currentStock > Int(sender.value) {
//                try fruitStore?.decreaseStock(fruit: FruitType.strawberry, amount: 1)
//            } else {
//                try
//            }
//            stockOfStrawberryLabel.text = Int(sender.value).description
//        case bananaStepper:
//            stockOfBananaLabel.text = Int(sender.value).description
//        case pineappleStepper:
//            stockOfPineappleLabel.text = Int(sender.value).description
//        case kiwiStepper:
//            stockOfKiwiLabel.text = Int(sender.value).description
//        case mangoStepper:
//            stockOfMangoLabel.text = Int(sender.value).description
//        default:
//            return
//        }
                
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
        changeFruitsStock()
        delegate?.JuiceOrderViewControllerHasChanges()
        self.presentingViewController?.dismiss(animated: true)
    }
}
