import UIKit

protocol FruitStoreViewControllerDelegate: AnyObject {
    func didDismiss(_ fruitStoreViewController: FruitStoreViewController)
}

final class FruitStoreViewController: UIViewController {
    @IBOutlet private var fruitLabelCollection: [UILabel]!
    @IBOutlet private var fruitStockStepper: [UIStepper]!

    private let juiceMaker: JuiceMaker?
    weak var delegate: FruitStoreViewControllerDelegate?
    
    init?(juiceMaker: JuiceMaker, coder: NSCoder) {
        self.juiceMaker = juiceMaker
        super.init(coder: coder)
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        delegate?.didDismiss(self)
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func tapStepper(_ sender: UIStepper) {
        guard let fruit = Fruit(rawValue: sender.tag) else {
            return
        }
        
        fruitLabelCollection[sender.tag].text = Int(sender.value).description
        juiceMaker?.updateInventory(fruit: fruit, value: Int(sender.value))
    }
}
