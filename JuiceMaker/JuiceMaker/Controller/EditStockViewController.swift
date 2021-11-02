import UIKit

class EditStockViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    @IBOutlet var fruitStockLabels: [UILabel]!
    
    @IBOutlet weak var strawberryStockStepper: UIStepper!
    @IBOutlet weak var bananaStockStepper: UIStepper!
    @IBOutlet weak var pineappleStockStepper: UIStepper!
    @IBOutlet weak var kiwiStockStepper: UIStepper!
    @IBOutlet weak var mangoStockStepper: UIStepper!
    @IBOutlet var fruitstockSteppers: [UIStepper]!
    
    let store = FruitStore.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeUIElements()
    }
    
    private func initializeStockLabel(at indexOfFruit: Int) {
        fruitStockLabels[indexOfFruit].text = "\(store.inventory[indexOfFruit].count)"
    }

    private func initializeStocktepper(at indexOfFruit: Int) {
        fruitstockSteppers[indexOfFruit].value = Double(store.inventory[indexOfFruit].count)
    }
    
    private func initializeUIElements() {
        for indexOfFruit in 0..<fruitStockLabels.count {
            initializeStockLabel(at: indexOfFruit)
            initializeStocktepper(at: indexOfFruit)
        }
    }
    
    private func editStock(changedStock: Int, fruit: FruitName) {
        let currentStock = store.inventory[fruit.indexOfInventory].count
        let stockDifference = changedStock - currentStock
        store.addStock(count: stockDifference, to: fruit)
    }
    
    @IBAction func strawberryStockStepperValueChanged(_ sender: UIStepper) {
        strawberryStockLabel.text = Int(sender.value).description
        editStock(changedStock: Int(sender.value), fruit: .strawberry)
    }
    @IBAction func bananaStockStepperValueChanged(_ sender: UIStepper) {
        bananaStockLabel.text = Int(sender.value).description
        editStock(changedStock: Int(sender.value), fruit: .banana)
    }
    @IBAction func pineappleStockStepperValueChanged(_ sender: UIStepper) {
        pineappleStockLabel.text = Int(sender.value).description
        editStock(changedStock: Int(sender.value), fruit: .pineapple)
    }
    @IBAction func kiwiStockStepperValueChanged(_ sender: UIStepper) {
        kiwiStockLabel.text = Int(sender.value).description
        editStock(changedStock: Int(sender.value), fruit: .kiwi)
    }
    @IBAction func mangoStockStepperValueChanged(_ sender: UIStepper) {
        mangoStockLabel.text = Int(sender.value).description
        editStock(changedStock: Int(sender.value), fruit: .mango)
    }
    
    @IBAction func tapDoneButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
