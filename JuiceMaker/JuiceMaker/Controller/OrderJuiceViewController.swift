import UIKit

class OrderJuiceViewController: UIViewController {
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    @IBOutlet var fruitStockLabels: [UILabel]!
    
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(refreshStockLabel),
                                               name: .didChangeStock,
                                               object: nil)
        initializeLabel()
    }
    
    private func refreshSelectedStockLabel(of fruit: FruitName) {
        fruitStockLabels[fruit.indexOfInventory].text = "\(juiceMaker.store.inventory[fruit.indexOfInventory].count)"
    }
    
    @objc private func refreshStockLabel(_ notifacation: Notification) {
        guard let changedFruit = notifacation.userInfo?["changedFruit"] as? FruitName else { return }
        
        refreshSelectedStockLabel(of: changedFruit)
    }
    
    private func initializeLabel() {
        for fruit in FruitName.allCases {
            refreshSelectedStockLabel(of: fruit)
        }
    }
    
    private func showSuccessAlert(message: String, btnTitle: String) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "\(btnTitle) OK",
                                     style: .default,
                                     handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func showLackOfStockAlert(message: String) {
        guard let editStockViewController = self.storyboard?.instantiateViewController(identifier: Storyboard.EditStockViewController.ID) else {
            return
        }
        
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "재고 수정⚒",
                                     style: .default) { (action) in
            self.present(editStockViewController, animated: true)
        }
        let cancelAction = UIAlertAction(title: "취소",
                                         style: .cancel,
                                         handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func receiveJuiceOrder(juiceName: JuiceName) {
        do {
            try juiceMaker.make(juiceName: juiceName)
            showSuccessAlert(message: "\(juiceName.kor) 나왔습니다! 맛있게 드세요!", btnTitle: juiceName.imoji)
        } catch FruitStoreError.lackOfStock(let fruit, let count) {
            let description = FruitStoreError.lackOfStock(fruitName: fruit, neededStock: count).description
            showLackOfStockAlert(message: description)
        } catch {
            print(error)
        }
    }
    
    @IBAction private func tapStrawberryBananaJuiceButton(_ sender: UIButton) {
        receiveJuiceOrder(juiceName: .strawberryBananaJuice)
    }
    @IBAction private func tapMangoKiwiJuiceButton(_ sender: UIButton) {
        receiveJuiceOrder(juiceName: .mangoKiwiJuice)
    }
    @IBAction private func tapStrawberryJuiceButton(_ sender: UIButton) {
        receiveJuiceOrder(juiceName: .strawberryJuice)
    }
    @IBAction private func tapBananaJuiceButton(_ sender: UIButton) {
        receiveJuiceOrder(juiceName: .bananaJuice)
    }
    @IBAction private func tapPineappleJuiceButton(_ sender: UIButton) {
        receiveJuiceOrder(juiceName: .pineappleJuice)
    }
    @IBAction private func tapKiwiJuiceButton(_ sender: UIButton) {
        receiveJuiceOrder(juiceName: .kiwiJuice)
    }
    @IBAction private func tapMangoJuiceButton(_ sender: UIButton) {
        receiveJuiceOrder(juiceName: .mangoJuice)
    }
}

