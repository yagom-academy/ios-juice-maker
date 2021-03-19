import UIKit

final class StockManagerViewController: UIViewController {
    private var juiceMaker = JuiceMaker.shared
    var strawberryStepper = FruitStockStepper(fruit: .strawberry)
    var bananaStepper = FruitStockStepper(fruit: .banana)
    var pineappleStepper = FruitStockStepper(fruit: .pineapple)
    var kiwiStepper = FruitStockStepper(fruit: .kiwi)
    var mangoStepper = FruitStockStepper(fruit: .mango)
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        initSaveButton()
        initStepper()
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true) {
        }
    }
    @IBAction func touchUpSaveButton(_ sender: Any) {
        print(strawberryStepper.kindFruit)
        print(strawberryStepper.value)
    }
    
    private func initSaveButton() {
        saveButton.layer.cornerRadius = 50
        saveButton.layer.borderWidth = 2
    }
    
    private func initStepper() {
        strawberryStepper.initStepper(amount: juiceMaker.fruitStorage.fruits[.strawberry])
        bananaStepper.initStepper(amount: juiceMaker.fruitStorage.fruits[.banana])
        pineappleStepper.initStepper(amount: juiceMaker.fruitStorage.fruits[.pineapple])
        kiwiStepper.initStepper(amount: juiceMaker.fruitStorage.fruits[.kiwi])
        mangoStepper.initStepper(amount: juiceMaker.fruitStorage.fruits[.mango])
    }
}
