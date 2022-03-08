import UIKit

class FruitStoreViewController: UIViewController {
    
    @IBOutlet var fruitLabelCollection: [UILabel]!
    var juiceMaker: JuiceMaker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitsStock()
    }
    
    private func updateFruitsStock() {
        guard let juiceMaker = juiceMaker else {
            return
        }
        
        for (index, stock) in juiceMaker.getFruitsStock().enumerated() {
            guard let fruitLabel = fruitLabelCollection[safeIndex: index] else {
                return
            }
            fruitLabel.text = String(stock)
        }
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

