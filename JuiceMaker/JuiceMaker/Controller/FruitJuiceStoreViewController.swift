//  Created by 애종,질리,벨라 on 2022/09/06.

import UIKit

class FruitJuiceStoreViewController: UIViewController {
    
    @IBOutlet weak var strawberryAmountLabel: UILabel!
    @IBOutlet weak var bananaAmountLabel: UILabel!
    @IBOutlet weak var pineappleAmountLabel: UILabel!
    @IBOutlet weak var kiwiAmountLabel: UILabel!
    @IBOutlet weak var mangoAmountLabel: UILabel!
    
    var juiceMaker: JuiceMakerProtocol = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateFruitAmountLabel(currentStockValue: receiveFruitStock())
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(resultInMakingJuice),
            name: Notification.Name("resultInmakingJuice"),
            object: nil)
    }
    
    @objc func resultInMakingJuice(_ notice: Notification) {
        guard let isSuccess: Bool = notice.userInfo?["isMakingSuccess"] as? Bool else { return }
        guard let juiceName: String = notice.userInfo?["juiceName"] as? String else { return }
        
        if isSuccess {
            updateFruitAmountLabel(currentStockValue: receiveFruitStock())
            
            let succeedAlert = UIAlertController(
                title: nil,
                message: "\(juiceName) 나왔습니다! 맛있게 드세요!",
                preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            
            succeedAlert.addAction(okAction)
            present(succeedAlert, animated: true, completion: nil)
        } else {
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
    }
    
    func receiveFruitStock() -> [Fruit: Int] {
        return juiceMaker.sendFruitStockValue()
    }
    
    func updateFruitAmountLabel(currentStockValue: [Fruit: Int]) {
        for target in currentStockValue {
            switch target.key {
            case .strawberry:
                updateLabel(amount: target.value, label: strawberryAmountLabel)
            case .banana:
                updateLabel(amount: target.value, label: bananaAmountLabel)
            case .kiwi:
                updateLabel(amount: target.value, label: kiwiAmountLabel)
            case .pineapple:
                updateLabel(amount: target.value, label: pineappleAmountLabel)
            case .mango:
                updateLabel(amount: target.value, label: mangoAmountLabel)
            }
        }
    }
    
    func updateLabel(amount: Int, label: UILabel) {
        label.text = "\(String(amount))"
    }
    
    @IBAction func touchUpStrawberryBananaJuiceOrderButton(_ sender: Any) {
        juiceMaker.chooseJuice(juice: .strawberryBananaJuice)
    }
    
    @IBAction func touchUpstrawberryJuiceOrderButton(_ sender: Any) {
        juiceMaker.chooseJuice(juice: .strawberryJuice)
    }
    
    @IBAction func touchUpBananaJuiceOrderButton(_ sender: Any) {
        juiceMaker.chooseJuice(juice: .bananaJuice)
    }
    
    @IBAction func touchUpPineappleJuiceOrderButton(_ sender: Any) {
        juiceMaker.chooseJuice(juice: .pineappleJuice)
    }
    
    @IBAction func touchUpKiwiJuiceOrderButton(_ sender: Any) {
        juiceMaker.chooseJuice(juice: .kiwiJuice)
    }
    
    @IBAction func touchUpMangoJuiceOrderButton(_ sender: Any) {
        juiceMaker.chooseJuice(juice: .mangoJuice)
    }
    
    @IBAction func touchUpMangoKiwiJuiceOrderButton(_ sender: Any) {
        juiceMaker.chooseJuice(juice: .mangoKiwiJuice)
    }
}
