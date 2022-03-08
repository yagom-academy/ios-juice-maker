import UIKit

class FruitStoreViewController: UIViewController {
    @IBOutlet var fruitLabelCollection: [UILabel]!
    @IBOutlet var fruitStockStepper: [UIStepper]!
    var juiceMaker: JuiceMaker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitsStock()
        updateStepperValue()
    }
    
    func updateStepperValue() {
        guard let juiceMaker = juiceMaker else {
            return
        }
        
        for (index, stock) in juiceMaker.getFruitsStock().enumerated() {
            guard let stepper = fruitStockStepper[safeIndex: index] else {
                return
            }
            stepper.value = Double(stock)
        }
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
    
    @IBAction func tapStepper(_ sender: UIStepper) {
        switch sender.tag {
        case 1:
            fruitLabelCollection[0].text = Int(sender.value).description
        case 2:
            fruitLabelCollection[1].text = Int(sender.value).description
        case 3:
            fruitLabelCollection[2].text = Int(sender.value).description
        case 4:
            fruitLabelCollection[3].text = Int(sender.value).description
        case 5:
            fruitLabelCollection[4].text = Int(sender.value).description
        default:
            return
        }
    }
    
}

