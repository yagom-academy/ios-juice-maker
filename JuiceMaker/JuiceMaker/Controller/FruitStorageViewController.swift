
import UIKit

class FruitStorageViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
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
        default:
            return
        }
    }
}
