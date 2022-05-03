import UIKit

class FruitStockViewController: UIViewController {

    var stocks = FruitStore(quantity: 0)
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStockLabel()
        setStepper()
    }
    
    func setStepper() {
        strawberryStepper.value = Double(stocks.stockAsString(fruit: .strawberry)) ?? 0.0
        bananaStepper.value = Double(stocks.stockAsString(fruit: .banana)) ?? 0.0
        pineappleStepper.value = Double(stocks.stockAsString(fruit: .pineapple)) ?? 0.0
        kiwiStepper.value = Double(stocks.stockAsString(fruit: .kiwi)) ?? 0.0
        mangoStepper.value = Double(stocks.stockAsString(fruit: .mango)) ?? 0.0
    }
    
    func setStockLabel() {
        strawberryStockLabel.text = stocks.stockAsString(fruit: .strawberry)
        bananaStockLabel.text = stocks.stockAsString(fruit: .banana)
        pineappleStockLabel.text = stocks.stockAsString(fruit: .pineapple)
        kiwiStockLabel.text = stocks.stockAsString(fruit: .kiwi)
        mangoStockLabel.text = stocks.stockAsString(fruit: .mango)
    }
    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        guard let fruit = Fruit(rawValue: sender.tag) else { return }
        
        stocks.modifyStock(fruit: fruit, to: Int(sender.value))
        
        switch fruit {
        case .strawberry:
            strawberryStockLabel.text = String(Int(sender.value))
        case .banana:
            bananaStockLabel.text = String(Int(sender.value))
        case .pineapple:
            pineappleStockLabel.text = String(Int(sender.value))
        case .kiwi:
            kiwiStockLabel.text = String(Int(sender.value))
        case .mango:
            mangoStockLabel.text = String(Int(sender.value))
        }
    }
}
