import UIKit

class FruitStockViewController: UIViewController {
    
    @IBOutlet var stockLabels: [UILabel]!
    @IBOutlet var stockSteppers: [UIStepper]!
    
    let fruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBackButton()
        setStockLabel()
        setStepper()
    }
    
    private func hideNavigationBackButton() {
        navigationItem.hidesBackButton = true
    }
    
    private func setStepper() {
        for (stepperValue, fruit) in zip(stockSteppers, Fruit.allCases) {
            stepperValue.value = fruitStore.stockAsDouble(fruit: fruit)
        }
    }
    
    private func setStockLabel() {
        for (stockLabel, fruit) in zip(stockLabels, Fruit.allCases) {
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
  
        stockLabels[sender.tag - 1].text = String(format: "%.0f", sender.value) 
    }
}
