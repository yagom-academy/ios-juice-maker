import UIKit

class FruitStoreViewController: UIViewController {
    @IBOutlet private var fruitLabelCollection: [UILabel]!
    @IBOutlet private var fruitStockStepper: [UIStepper]!
    var juiceMaker: JuiceMaker?
    var delegate: UpdateData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitsStock()
        updateStepperValue()
    }
    
    private func updateStepperValue() {
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
    
    @IBAction private func closeButton(_ sender: UIBarButtonItem) {
        delegate?.updateFruitStock()
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func tapStepper(_ sender: UIStepper) {
        guard let fruit = Fruit(rawValue: sender.tag) else {
            return
        }
        fruitLabelCollection[sender.tag].text = Int(sender.value).description
        juiceMaker?.fruitStore.updateInventory(fruit: fruit, value: Int(sender.value))
    }
}

