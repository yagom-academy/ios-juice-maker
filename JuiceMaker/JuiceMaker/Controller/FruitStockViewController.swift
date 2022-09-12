import UIKit

class FruitStockViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    lazy var fruitLabel: [Fruit: UILabel] = [
        .strawberry: strawberryStockLabel,
        .banana: bananaStockLabel,
        .pineapple: pineappleStockLabel,
        .kiwi: kiwiStockLabel,
        .mango: mangoStockLabel
    ]
    
    func updateFruitStockLabel() {
        for (fruit, label) in fruitLabel {
            label.text = String(FruitStore.sharedFruitStore.fetchStockOf(fruit))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateFruitStockLabel()
    }
    
    @IBAction func touchUpDismissButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
