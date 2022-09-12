import UIKit

class FruitStockViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    lazy var fruitLabel: [Fruit: UILabel] = [
        .strawberry: strawberryStockLabel,
        .banana: bananaStockLabel,
        .pineapple: pineappleStockLabel,
        .kiwi: kiwiStockLabel,
        .mango: mangoStockLabel
    ]
    
    func updateFruitStockLabel() {
        for (fruit, label) in fruitLabel {
            label.text = String(FruitStore.sharedFruitStore.fetchStockOf(fruit))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateFruitStockLabel()
    }
    
    @IBAction func touchUpDismissButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func changeFruitStock(_ sender: UIStepper) {
        let fruitStepper: [UIStepper: Fruit] = [
            strawberryStepper: .strawberry,
            bananaStepper: .banana,
            pineappleStepper: .pineapple,
            kiwiStepper: .kiwi,
            mangoStepper: .mango
        ]

        sender.minimumValue = -1
        
        guard let fruit = fruitStepper[sender],
              let fruitLabel = fruitLabel[fruit] else { return }
        
        FruitStore.sharedFruitStore.changeStockOf(fruit: fruit, by: Int(sender.value))
        
        fruitLabel.text = String(FruitStore.sharedFruitStore.fetchStockOf(fruit))
        
        sender.value = 0
    }
    
    
    
    
}
