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
    
    @IBOutlet private weak var strawberryStepper: FruitStepper!
    @IBOutlet private weak var bananaStepper: FruitStepper!
    @IBOutlet private weak var pineappleStepper: FruitStepper!
    @IBOutlet private weak var kiwiStepper: FruitStepper!
    @IBOutlet private weak var mangoStepper: FruitStepper!

    @IBOutlet var fruitLabels: [FruitLabel]!
    @IBOutlet var fruitSteppers: [FruitStepper]!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupFruitLabel()
        setupFruitStepper()
    }
    
    private func setupFruitLabel() {
        setupFruitLabelType()
        setupFruitLabelText()
    }
    
    private func setupFruitLabelType() {
        stockOfStrawberryLabel.fruitType = .strawberry
        stockOfBananaLabel.fruitType = .banana
        stockOfPineappleLabel.fruitType = .pineapple
        stockOfKiwiLabel.fruitType = .kiwi
        stockOfMangoLabel.fruitType = .mango
    }
    
    private func setupFruitStepperType() {
        strawberryStepper.fruitType = .strawberry
        bananaStepper.fruitType = .banana
        pineappleStepper.fruitType = .pineapple
        kiwiStepper.fruitType = .kiwi
        mangoStepper.fruitType = .mango
    }
    
    
    private func setupFruitLabelText() {
        guard let fruitStore = fruitStore else { return }
        fruitLabels.forEach({
            guard let fruitType = $0.fruitType else { return }
            $0.text = String(fruitStore.numberOfStock(fruit: fruitType))
        })
    }
    
    private func setupFruitStepper() {
        setupFruitStepperType()
        setupFruitStepperOption()
        setupFruitStepperLabel()
    }
    
    private func setupFruitStepperOption() {
        fruitSteppers.forEach({
            $0.autorepeat = true
            $0.minimumValue = minimumNumberOfStock
        })
    }
    
    private func setupFruitStepperLabel() {
        guard let fruitStore = fruitStore else { return }
        fruitSteppers.forEach({
            guard let fruitType = $0.fruitType else { return }
            $0.value = Double(fruitStore.numberOfStock(fruit: fruitType))
        })
    }
    
    @IBAction private func stepperValueChangedAction(_ sender: FruitStepper) {
        fruitLabels.filter({ $0.fruitType == sender.fruitType }).last?.text = Int(sender.value).description
        guard let currentStock = fruitStore?.numberOfStock(fruit: FruitType.strawberry) else { return }
        let afterStock = Int(sender.value)
        
        guard let fruitType = sender.fruitType else { return }
        if currentStock > afterStock {
            do {
                try fruitStore?.decreaseStock(fruit: fruitType, amount: 1)
            } catch {  }
        } else {
            fruitStore?.increaseStock(fruit: fruitType, amount: 1)
        }
    }
    
    @IBAction private func closeManageStockView(_ sender: UIBarButtonItem) {
        delegate?.JuiceOrderViewControllerHasChanges()
        self.presentingViewController?.dismiss(animated: true)
    }
}
