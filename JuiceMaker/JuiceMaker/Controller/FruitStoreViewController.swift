import UIKit

final class FruitStoreViewController: UIViewController {
    
    private let center: NotificationCenter = NotificationCenter.default
    
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
    
    private lazy var fruitStockStepper: [FruitStore.Fruit: UIStepper] = [
        .strawberry: strawberryStepper,
        .banana: bananaStepper,
        .pineapple: pineappleStepper,
        .kiwi: kiwiStepper,
        .mango: mangoStepper
    ]
    
    private func configureCurrentStock() {
        for (fruit, value) in fruitStockValue {
            value.text = String(FruitStore.shared.checkStockValue(fruit: fruit))
        }
    }
    
    private func setFruitStepper() {
        for (fruit, stepper) in fruitStockStepper {
            stepper.value = Double(FruitStore.shared.checkStockValue(fruit: fruit))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureCurrentStock()
        setFruitStepper()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        center.post(name: .stockNotification, object: nil, userInfo: ["newStock": addStockListByStepper()])
    }
    
    private func configureUI() {
        let fruitLabelList: [UILabel] = [strawberryLabel, bananaLabel, pineappleLabel, kiwiLabel,
                                         mangoLabel]
        let cornerRadiusValue: CGFloat = 7
        
        self.navigationController?.navigationBar.backgroundColor = .systemGray4
        
        for label in fruitLabelList {
            label.layer.cornerRadius = cornerRadiusValue
            label.clipsToBounds = true
        }
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
    
    private func addStockListByStepper() -> [FruitStore.Fruit: Int] {
        var stockList: [FruitStore.Fruit: Int] = [:]
        for (fruit, value) in fruitStockValue {
            guard let quantityAdded = value.text, let stockToBeAdded = Int(quantityAdded) else {
                return addStockListByStepper()
            }
            stockList[fruit] = stockToBeAdded
        }
        return stockList
    }
}
