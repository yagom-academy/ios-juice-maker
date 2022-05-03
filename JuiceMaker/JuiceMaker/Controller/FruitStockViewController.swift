import UIKit

class FruitStockViewController: UIViewController {

    var stocks = JuiceMaker()
    
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
        strawberryStepper.value = Double(stocks.stockCount(of: .strawberry)) ?? 0.0
        bananaStepper.value = Double(stocks.stockCount(of: .banana)) ?? 0.0
        pineappleStepper.value = Double(stocks.stockCount(of: .pineapple)) ?? 0.0
        kiwiStepper.value = Double(stocks.stockCount(of: .kiwi)) ?? 0.0
        mangoStepper.value = Double(stocks.stockCount(of: .mango)) ?? 0.0
    }
    
    func setStockLabel() {
        strawberryStockLabel.text = stocks.stockCount(of: .strawberry)
        bananaStockLabel.text = stocks.stockCount(of: .banana)
        pineappleStockLabel.text = stocks.stockCount(of: .pineapple)
        kiwiStockLabel.text = stocks.stockCount(of: .kiwi)
        mangoStockLabel.text = stocks.stockCount(of: .mango)
    }
    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        guard let fruit = Fruit(rawValue: sender.tag) else { return }
        
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
