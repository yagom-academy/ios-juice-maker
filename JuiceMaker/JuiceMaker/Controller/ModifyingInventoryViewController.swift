import UIKit

class ModifyingInventoryViewController: UIViewController {
    var inventoryList: [Fruit: Int] = [:]
    
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
        if let navigationController = navigationController as? ModifyingInventoryNavigationController,
           let delegate = navigationController.juiceOrderViewDelegate {
            self.inventoryList = delegate.juiceOrderViewInventoryList
        } else {
            let defaultValueOfInventory = 10
            
            Fruit.allCases.forEach {
                self.inventoryList[$0] = defaultValueOfInventory
            }
        }
        
        inventoryList.forEach { (fruit: Fruit, inventory: Int) in
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
        stepper.minimumValue = 0
        stepper.maximumValue = 10000
        stepper.stepValue = 1
        stepper.value = value
        stepper.autorepeat = true
        stepper.isContinuous = true
        stepper.wraps = false
    }
    
    //MARK: -Action
    @IBAction func touchUpCloseButton(_ sender: UIBarButtonItem) {
        if let navigationController = navigationController as? ModifyingInventoryNavigationController,
           let delegate = navigationController.juiceOrderViewDelegate {
            delegate.juiceOrderViewDidChangeInventoryList(inventoryList)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeStrawberryInventory(_ sender: UIStepper) {
        let value = Int(sender.value)
        inventoryList[.strawberry] = value
        strawberryLabel.text = value.description
    }
    
    @IBAction func changeBananaInventory(_ sender: UIStepper) {
        let value = Int(sender.value)
        inventoryList[.banana] = value
        bananaLabel.text = value.description
    }
    
    @IBAction func changeMangoInventory(_ sender: UIStepper) {
        let value = Int(sender.value)
        inventoryList[.mango] = value
        mangoLabel.text = value.description
    }
    
    @IBAction func changePineappleInventory(_ sender: UIStepper) {
        let value = Int(sender.value)
        inventoryList[.pineapple] = value
        pineappleLabel.text = value.description
    }
    
    @IBAction func changeKiwiInventory(_ sender: UIStepper) {
        let value = Int(sender.value)
        inventoryList[.kiwi] = value
        kiwiLabel.text = value.description
    }
}
