
import UIKit

class FruitStorageViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func completeModifyButton(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func stepperTest(_ sender: UIStepper) {
        switch sender {
        case strawberryStepper:
            strawberryStockLabel.text = Int(strawberryStepper.value).description
        case bananaStepper:
            bananaStockLabel.text = Int(bananaStepper.value).description
        case mangoStepper:
            mangoStockLabel.text = Int(mangoStepper.value).description
        case kiwiStepper:
            kiwiStockLabel.text = Int(kiwiStepper.value).description
        case pineappleStepper:
            pineappleStockLabel.text = Int(pineappleStepper.value).description
        default:
            return
        }
    }
}
