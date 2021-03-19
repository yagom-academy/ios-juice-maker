import UIKit

final class StockManagerViewController: UIViewController {
    private var juiceMaker = JuiceMaker.shared
    
    @IBOutlet weak var strawberryStepper: FruitStockStepper!
    @IBOutlet weak var bananaStepper: FruitStockStepper!
    @IBOutlet weak var pineappleStepper: FruitStockStepper!
    @IBOutlet weak var kiwiStepper: FruitStockStepper!
    @IBOutlet weak var mangoStepper: FruitStockStepper!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSaveButton()
        initStepper()
    }
    
    @IBAction func closeButton(_ sender: Any) {
        saveStockAlert()
    }
    @IBAction func touchUpSaveButton(_ sender: Any) {
        saveStockAlert()
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
    
    func saveStockAlert() {
        let saveAlert = UIAlertController(title: nil , message: "재고를 수정할까요?", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "아니오", style: .default) { action in
            self.dismiss(animated: true)
        }
        let stockSettingAction = UIAlertAction(title: "예", style: .default) { action in
            self.successAlert()
            self.dismiss(animated: true) {
                self.juiceMaker.fruitStorage.manageStorage(fruit: .strawberry,
                                                           amount: self.strawberryStepper.value - self.juiceMaker.fruitStorage.fruits[.strawberry]!)
                self.juiceMaker.fruitStorage.manageStorage(fruit: .banana,
                                                           amount: self.bananaStepper.value - self.juiceMaker.fruitStorage.fruits[.banana]!)
                self.juiceMaker.fruitStorage.manageStorage(fruit: .pineapple,
                                                           amount: self.pineappleStepper.value - self.juiceMaker.fruitStorage.fruits[.pineapple]!)
                self.juiceMaker.fruitStorage.manageStorage(fruit: .kiwi,
                                                           amount: self.kiwiStepper.value - self.juiceMaker.fruitStorage.fruits[.kiwi]!)
                self.juiceMaker.fruitStorage.manageStorage(fruit: .mango,
                                                            amount: self.mangoStepper.value - self.juiceMaker.fruitStorage.fruits[.mango]!)
                self.dismiss(animated: true)
            }
        }
        saveAlert.addAction(cancel)
        saveAlert.addAction(stockSettingAction)
        present(saveAlert, animated: true)
    }
    
    func successAlert() {
        let successAlert = UIAlertController(title: nil, message: "수정되었습니다", preferredStyle: .alert)
        present(successAlert, animated: true)
    }
}
