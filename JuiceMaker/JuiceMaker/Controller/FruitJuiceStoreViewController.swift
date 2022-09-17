//  Created by 애종,질리,벨라 on 2022/09/06.

import UIKit

class FruitJuiceStoreViewController: UIViewController, FruitStockDelegate {
    
    @IBOutlet weak var strawberryAmountLabel: UILabel!
    @IBOutlet weak var bananaAmountLabel: UILabel!
    @IBOutlet weak var pineappleAmountLabel: UILabel!
    @IBOutlet weak var kiwiAmountLabel: UILabel!
    @IBOutlet weak var mangoAmountLabel: UILabel!
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    
    let juiceMaker: JuiceMakerProtocol = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateFruitAmountLabel(currentStockValue: receiveFruitStock())
        
        for target in buttonCollection {
            target.titleLabel?.textAlignment = .center
        }
    }
    
    func takeOrder(juice: Juice) {
        do {
            try juiceMaker.canMakeJuice(juice.recipe)
            juiceMaker.make(juice)
            updateFruitAmountLabel(currentStockValue: receiveFruitStock())
            displaySuccessAlert(juiceName: juice.rawValue)
            
        } catch JuiceMakerError.notEnoughStock {
            displayFailedAlert()
        } catch {
            debugPrint("알 수 없는 오류가 발생하였습니다.")
        }
    }
    
    func displaySuccessAlert(juiceName: String) {
        let successAlert = UIAlertController(
            title: nil,
            message: "\(juiceName) 나왔습니다! 맛있게 드세요!",
            preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        successAlert.addAction(okAction)
        present(successAlert, animated: true, completion: nil)
    }
    
    func displayFailedAlert() {
        let failedAlert = UIAlertController(
            title: nil,
            message: "재고가 모자라요. 재고를 수정할까요?",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "예",
            style: .default) { action in
                self.performSegue(
                    withIdentifier: "presentFruitStockEditorViewController",
                    sender: self)
            }
        let cancelAction = UIAlertAction(
            title: "아니오",
            style: .cancel
        )
        
        failedAlert.addAction(okAction)
        failedAlert.addAction(cancelAction)
        present(failedAlert, animated: true, completion: nil)
    }
    
    func receiveFruitStock() -> FruitStock {
        return juiceMaker.getFruitStock()
    }
    
    func receiveEditedFruitStock(fruitStock: FruitStock) {
        juiceMaker.updateAllFruitStock(fruitStock: fruitStock)
        updateFruitAmountLabel(currentStockValue: receiveFruitStock())
    }
    
    func updateFruitAmountLabel(currentStockValue: FruitStock) {
        for target in currentStockValue {
            updateLabel(amount: target.value, type: target.key)
        }
    }
    
    func updateLabel(amount: Int, type: Fruit) {
        switch type {
        case .strawberry:
            strawberryAmountLabel.text = "\(amount)"
        case .banana:
            bananaAmountLabel.text = "\(amount)"
        case .kiwi:
            kiwiAmountLabel.text = "\(amount)"
        case .pineapple:
            pineappleAmountLabel.text = "\(amount)"
        case .mango:
            mangoAmountLabel.text = "\(amount)"
        }
    }
    
    @IBAction func touchUpStrawberryBananaJuiceOrderButton(_ sender: Any) {
        takeOrder(juice: .strawberryBananaJuice)
    }
    
    @IBAction func touchUpstrawberryJuiceOrderButton(_ sender: Any) {
        takeOrder(juice: .strawberryJuice)
    }
    
    @IBAction func touchUpBananaJuiceOrderButton(_ sender: Any) {
        takeOrder(juice: .bananaJuice)
    }
    
    @IBAction func touchUpPineappleJuiceOrderButton(_ sender: Any) {
        takeOrder(juice: .pineappleJuice)
    }
    
    @IBAction func touchUpKiwiJuiceOrderButton(_ sender: Any) {
        takeOrder(juice: .kiwiJuice)
    }
    
    @IBAction func touchUpMangoJuiceOrderButton(_ sender: Any) {
        takeOrder(juice: .mangoJuice)
    }
    
    @IBAction func touchUpMangoKiwiJuiceOrderButton(_ sender: Any) {
        takeOrder(juice: .mangoKiwiJuice)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let fruitStockEditorViewController = segue.destination as? FruitStockEditorViewController else { return }
        fruitStockEditorViewController.editingFruitStock = receiveFruitStock()
        fruitStockEditorViewController.delegate = self
    }
}
