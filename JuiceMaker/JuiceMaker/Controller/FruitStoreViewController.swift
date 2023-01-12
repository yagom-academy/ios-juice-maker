import UIKit

final class FruitStoreViewController: UIViewController {
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    private lazy var fruitStockValue: [FruitStore.Fruit: UILabel] = [
        .strawberry: strawberryLabel,
        .banana: bananaLabel,
        .pineapple: pineappleLabel,
        .kiwi: kiwiLabel,
        .mango: mangoLabel
    ]
    
    private func configureCurrentStock() {
        for (fruit, value) in fruitStockValue {
            value.text = String(FruitStore.shared.checkStockValue(fruit: fruit))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureCurrentStock()
    }
    
    private func configureUI() {
        self.navigationController?.navigationBar.backgroundColor = .systemGray4
        strawberryLabel.layer.cornerRadius = 7
        strawberryLabel.clipsToBounds = true
        bananaLabel.layer.cornerRadius = 7
        bananaLabel.clipsToBounds = true
        pineappleLabel.layer.cornerRadius = 7
        pineappleLabel.clipsToBounds = true
        kiwiLabel.layer.cornerRadius = 7
        kiwiLabel.clipsToBounds = true
        mangoLabel.layer.cornerRadius = 7
        mangoLabel.clipsToBounds = true
    }
    
    
    @IBAction func touchUpDissmisButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func changeStrawberryStock(_ sender: UIStepper) {
        strawberryLabel.text = Int(sender.value).description
    }
    @IBAction func changeBananaStock(_ sender: UIStepper) {
        bananaLabel.text = Int(sender.value).description
    }
    @IBAction func changePineappleStock(_ sender: UIStepper) {
        pineappleLabel.text = Int(sender.value).description
    }
    @IBAction func changeKiwiStock(_ sender: UIStepper) {
        kiwiLabel.text = Int(sender.value).description
    }
    @IBAction func changeMangoStock(_ sender: UIStepper) {
        mangoLabel.text = Int(sender.value).description
    }
    
    
    
}
