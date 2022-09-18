import UIKit

class ModifyingInventoryViewController: UIViewController {
    weak var delegate: JuiceOrderViewDelegate?
    weak var juiceOrderViewControllerFruitStore: FruitStore?
    private var fruitStore: FruitStore = FruitStore()
    
    private let stepperMaxValue: Double = 10000
    private let stepperMinValue: Double = 0
    private let stepperStepValue: Double = 1
    
    //MARK: -View
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpInventory()
    }
    
    func setUpInventory() {
        if let receivedFruitStore = juiceOrderViewControllerFruitStore {
            self.fruitStore = receivedFruitStore
        }
        
        fruitStore.inventoryList.forEach { (fruit: Fruit, inventory: Int) in
            switch fruit {
            case .strawberry:
                strawberryLabel.text = "\(inventory)"
                setUpStepper(of: strawberryStepper, Double(inventory))
            case .banana:
                bananaLabel.text = "\(inventory)"
                setUpStepper(of: bananaStepper, Double(inventory))
            case .kiwi:
                kiwiLabel.text = "\(inventory)"
                setUpStepper(of: kiwiStepper, Double(inventory))
            case .pineapple:
                pineappleLabel.text = "\(inventory)"
                setUpStepper(of: pineappleStepper, Double(inventory))
            case .mango:
                mangoLabel.text = "\(inventory)"
                setUpStepper(of: mangoStepper, Double(inventory))
            }
        }
    }
    
    func setUpStepper(of stepper: UIStepper, _ value: Double) {
        stepper.minimumValue = stepperMinValue
        stepper.maximumValue = stepperMaxValue
        stepper.stepValue = stepperStepValue
        stepper.value = value
        stepper.autorepeat = true
        stepper.isContinuous = true
        stepper.wraps = false
    }
    
    //MARK: -Action
    @IBAction func touchUpCloseButton(_ sender: UIBarButtonItem) {
        delegate?.juiceOrderViewController(didChange: self.fruitStore)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeStrawberryInventory(_ sender: UIStepper) {
        let value = Int(sender.value)
        fruitStore.update(of: .strawberry, to: value)
        strawberryLabel.text = value.description
    }
    
    @IBAction func changeBananaInventory(_ sender: UIStepper) {
        let value = Int(sender.value)
        fruitStore.update(of: .banana, to: value)
        bananaLabel.text = value.description
    }
    
    @IBAction func changeMangoInventory(_ sender: UIStepper) {
        let value = Int(sender.value)
        fruitStore.update(of: .mango, to: value)
        mangoLabel.text = value.description
    }
    
    @IBAction func changePineappleInventory(_ sender: UIStepper) {
        let value = Int(sender.value)
        fruitStore.update(of: .pineapple, to: value)
        pineappleLabel.text = value.description
    }
    
    @IBAction func changeKiwiInventory(_ sender: UIStepper) {
        let value = Int(sender.value)
        fruitStore.update(of: .kiwi, to: value)
        kiwiLabel.text = value.description
    }
}
