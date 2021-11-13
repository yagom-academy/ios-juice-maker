import UIKit

class EditStockViewController: UIViewController {

    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    @IBOutlet private var fruitStockLabels: [UILabel]!
    
    @IBOutlet private weak var strawberryStockStepper: UIStepper!
    @IBOutlet private weak var bananaStockStepper: UIStepper!
    @IBOutlet private weak var pineappleStockStepper: UIStepper!
    @IBOutlet private weak var kiwiStockStepper: UIStepper!
    @IBOutlet private weak var mangoStockStepper: UIStepper!
    @IBOutlet private var fruitStockSteppers: [UIStepper]!
    
    private let store = FruitStore.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeUIElements()
    }
    
    private func initializeStockLabel(at indexOfFruit: Int) {
        fruitStockLabels[indexOfFruit].text = "\(store.inventory[indexOfFruit].count)"
    }

    private func initializeStockStepper(at indexOfFruit: Int) {
        fruitStockSteppers[indexOfFruit].value = Double(store.inventory[indexOfFruit].count)
    }
    
    private func initializeUIElements() {
        for indexOfFruit in 0..<fruitStockLabels.count {
            initializeStockLabel(at: indexOfFruit)
            initializeStockStepper(at: indexOfFruit)
        }
    }
    
    private func editStock(changedStock: Int, fruit: FruitName) {
        let currentStock = store.inventory[fruit.indexOfInventory].count
        let stockDifference = changedStock - currentStock
        store.addStock(count: stockDifference, to: fruit)
    }
    
    @IBAction private func strawberryStockStepperValueChanged(_ sender: UIStepper) {
        strawberryStockLabel.text = Int(sender.value).description
        editStock(changedStock: Int(sender.value), fruit: .strawberry)
    }
    @IBAction private func bananaStockStepperValueChanged(_ sender: UIStepper) {
        bananaStockLabel.text = Int(sender.value).description
        editStock(changedStock: Int(sender.value), fruit: .banana)
    }
    @IBAction private func pineappleStockStepperValueChanged(_ sender: UIStepper) {
        pineappleStockLabel.text = Int(sender.value).description
        editStock(changedStock: Int(sender.value), fruit: .pineapple)
    }
    @IBAction private func kiwiStockStepperValueChanged(_ sender: UIStepper) {
        kiwiStockLabel.text = Int(sender.value).description
        editStock(changedStock: Int(sender.value), fruit: .kiwi)
    }
    @IBAction private func mangoStockStepperValueChanged(_ sender: UIStepper) {
        mangoStockLabel.text = Int(sender.value).description
        editStock(changedStock: Int(sender.value), fruit: .mango)
    }
    
    @IBAction private func tapDoneButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
