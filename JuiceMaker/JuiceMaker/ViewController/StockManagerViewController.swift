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
        dismiss(animated: true)
    }
    @IBAction func touchUpSaveButton(_ sender: Any) {
        saveStockAlert()
    }
    
    private func initSaveButton() {
        saveButton.layer.cornerRadius = 50
        saveButton.layer.borderWidth = 2
    }
    
    private func initStepper() {
        strawberryStepper.initStepper(amount: juiceMaker.currentFruit(kindFruit: .strawberry))
        bananaStepper.initStepper(amount: juiceMaker.currentFruit(kindFruit: .banana))
        pineappleStepper.initStepper(amount: juiceMaker.currentFruit(kindFruit: .pineapple))
        kiwiStepper.initStepper(amount: juiceMaker.currentFruit(kindFruit: .kiwi))
        mangoStepper.initStepper(amount: juiceMaker.currentFruit(kindFruit: .mango))
    }
    
    private func saveStockAlert() {
        let saveAlert = UIAlertController(title: nil , message: "재고를 수정할까요?", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "아니오", style: .default) { action in
            self.dismiss(animated: true)
        }
        let stockSettingAction = UIAlertAction(title: "예", style: .default) { action in
            self.successAlert()
            self.dismiss(animated: true) {
                self.juiceMaker.consume(fruit: .strawberry,
                                        amount: self.juiceMaker.currentFruit(kindFruit: .strawberry)! - self.strawberryStepper.value)
                self.juiceMaker.consume(fruit: .banana,
                                        amount: self.juiceMaker.currentFruit(kindFruit: .banana)! - self.bananaStepper.value)
                self.juiceMaker.consume(fruit: .pineapple,
                                        amount: self.juiceMaker.currentFruit(kindFruit: .pineapple)! - self.pineappleStepper.value)
                self.juiceMaker.consume(fruit: .kiwi,
                                        amount: self.juiceMaker.currentFruit(kindFruit: .kiwi)! - self.kiwiStepper.value)
                self.juiceMaker.consume(fruit: .mango,
                                        amount: self.juiceMaker.currentFruit(kindFruit: .mango)! - self.mangoStepper.value)
                self.dismiss(animated: true)
            }
        }
        saveAlert.addAction(cancel)
        saveAlert.addAction(stockSettingAction)
        present(saveAlert, animated: true)
    }
    
    private func successAlert() {
        let successAlert = UIAlertController(title: nil, message: "수정되었습니다", preferredStyle: .alert)
        present(successAlert, animated: true)
    }
}
