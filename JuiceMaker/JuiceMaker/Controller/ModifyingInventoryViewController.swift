import UIKit

class ModifyingInventoryViewController: UIViewController {
    static let identifier: String = "ModifyingInventoryViewController"

    weak var delegater: FruitInventoryDelegate?
    var inventoryList: [Fruit: Int] = [:]
    
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
        // Do any additional setup after loading the view.
        fetchInventory()
    }
    
    func fetchInventory() {
        guard let delegater = delegater else {
            return
        }
        self.inventoryList = delegater.inventoryList
        
        inventoryList.forEach { (fruit: Fruit, inventory: Int) in
            switch fruit {
            case .strawberry:
                strawberryLabel.text = "\(inventory)"
                strawberryStepper.value = Double(inventory)
            case .banana:
                bananaLabel.text = "\(inventory)"
                bananaStepper.value = Double(inventory)
            case .kiwi:
                kiwiLabel.text = "\(inventory)"
                kiwiStepper.value = Double(inventory)
            case .pineapple:
                pineappleLabel.text = "\(inventory)"
                pineappleStepper.value = Double(inventory)
            case .mango:
                mangoLabel.text = "\(inventory)"
                mangoStepper.value = Double(inventory)
            }
        }
    }
    
    @IBAction func touchUpCloseButton(_ sender: UIBarButtonItem) {
        delegater?.deliver(inventoryList)
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
