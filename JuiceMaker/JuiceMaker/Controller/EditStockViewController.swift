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
    }
    
    @IBAction func tapDoneButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
