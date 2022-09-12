import UIKit

class ModifyingInventoryViewController: UIViewController {
    static let identifier: String = "ModifyingInventoryViewController"

    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    
    var receivedFruitStore: FruitStore?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchInventory()
    }
    
    func fetchInventory() {
        guard let fruitStore = receivedFruitStore else {
            return
        }
        
        fruitStore.inventoryList.forEach { (fruit: Fruit, inventory: Int) in
            switch fruit {
            case .strawberry:
                strawberryLabel.text = "\(inventory)"
            case .banana:
                bananaLabel.text = "\(inventory)"
            case .kiwi:
                kiwiLabel.text = "\(inventory)"
            case .pineapple:
                pineappleLabel.text = "\(inventory)"
            case .mango:
                mangoLabel.text = "\(inventory)"
            }
        }
    }
    
    @IBAction func touchUpCloseButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
