import UIKit

class FruitStockViewController: UIViewController {

    var stocks = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStockLabel()
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
}
