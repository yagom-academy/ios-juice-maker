import UIKit

class FruitStoreViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var strawberryLabel: UILabel!
    
    @IBAction func strawberryStepper(_ sender: UIStepper) {
        strawberryLabel.text = Int(sender.value).description
    }
    
}
