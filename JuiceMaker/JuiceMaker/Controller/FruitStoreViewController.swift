import UIKit

class FruitStoreViewController: UIViewController {
    
    @IBOutlet var fruitLabelCollection: [UILabel]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeButton(_ sender: UIBarButtonItem) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func stawberryStepper(_ sender: UIStepper) {
    }
    
    @IBAction func bananaStepper(_ sender: UIStepper) {
    }
    
    @IBAction func pineappleStepper(_ sender: UIStepper) {
    }
    
    @IBAction func kiwiStepper(_ sender: UIStepper) {
    }
    
    @IBAction func mangoStepper(_ sender: UIStepper) {
    }
    
}

