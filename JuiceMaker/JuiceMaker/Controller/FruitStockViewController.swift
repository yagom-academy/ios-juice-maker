import UIKit

class FruitStockViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    var fruitStore = FruitStore(quantity: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setStockLabel()
        setStepper()
    }
    
    private func setStepper() {
        strawberryStepper.value = fruitStore.stockAsDouble(fruit: .strawberry)
        bananaStepper.value = fruitStore.stockAsDouble(fruit: .banana)
        pineappleStepper.value = fruitStore.stockAsDouble(fruit: .pineapple)
        kiwiStepper.value = fruitStore.stockAsDouble(fruit: .kiwi)
        mangoStepper.value = fruitStore.stockAsDouble(fruit: .mango)
    }
    
    private func setStockLabel() {
        strawberryStockLabel.text = fruitStore.stockAsString(fruit: .strawberry)
        bananaStockLabel.text = fruitStore.stockAsString(fruit: .banana)
        pineappleStockLabel.text = fruitStore.stockAsString(fruit: .pineapple)
        kiwiStockLabel.text = fruitStore.stockAsString(fruit: .kiwi)
        mangoStockLabel.text = fruitStore.stockAsString(fruit: .mango)
    }
    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        let stockValue = sender.value
        guard let fruit = Fruit(rawValue: sender.tag) else { return }
        
        fruitStore.modifyStock(fruit: fruit, to: Int(stockValue))
        
        switch fruit {
        case .strawberry:
            strawberryStockLabel.text = stockValue.toString
        case .banana:
            bananaStockLabel.text = stockValue.toString
        case .pineapple:
            pineappleStockLabel.text = stockValue.toString
        case .kiwi:
            kiwiStockLabel.text = stockValue.toString
        case .mango:
            mangoStockLabel.text = stockValue.toString
        }
    }
}
