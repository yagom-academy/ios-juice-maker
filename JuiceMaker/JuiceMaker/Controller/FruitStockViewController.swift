import UIKit

class FruitStockViewController: UIViewController {
    
    @IBOutlet var stockLabelCollection: [UILabel]!
    @IBOutlet var stepperCollection: [UIStepper]!
    
    var fruitStore = FruitStore(quantity: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setStockLabel()
        setStepper()
    }
    
    private func setStepper() {
        for (stepperValue, fruit) in zip(stepperCollection, Fruit.allCases) {
            stepperValue.value = fruitStore.stockAsDouble(fruit: fruit)
        }
    }
    
    private func setStockLabel() {
        for (stockLabel, fruit) in zip(stockLabelCollection, Fruit.allCases) {
            stockLabel.text = fruitStore.stockAsString(fruit: fruit)
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        let stockValue = sender.value
        guard let fruit = Fruit(rawValue: sender.tag) else { return }
        
        fruitStore.modifyStock(fruit: fruit, to: Int(stockValue))
  
        stockLabelCollection[sender.tag - 1].text = stockValue.toString
    }
}
