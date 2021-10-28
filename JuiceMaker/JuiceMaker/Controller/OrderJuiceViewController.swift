import UIKit

class OrderJuiceViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    var juiceMaker = JuiceMaker()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(refreshStockLabel), name: .didChangeStock, object: nil)
        initializeLabel()

        initializeLabel()
    }
    
    func refreshSelectedStockLabel(of fruit: FruitName) {
        switch fruit {
        case .strawberry:
            strawberryStockLabel.text = "\(juiceMaker.store.inventory[0].count)" // Notification을 사용하려면 juiceMaker를 Structure Class로 바꿔줘야 함
        case .banana:
            bananaStockLabel.text = "\(juiceMaker.store.inventory[1].count)"
        case .pineapple:
            pineappleStockLabel.text = "\(juiceMaker.store.inventory[2].count)"
        case .kiwi:
            kiwiStockLabel.text = "\(juiceMaker.store.inventory[3].count)"
        case .mango:
            mangoStockLabel.text = "\(juiceMaker.store.inventory[4].count)"
        }
    }
    
    @objc func refreshStockLabel(_ notifacation: Notification) {
        guard let changedFruit = notifacation.userInfo?["changedFruit"] as? FruitName else { return }
        
        refreshSelectedStockLabel(of: changedFruit)
    }
    
    func initializeLabel() {
        strawberryStockLabel.text = "\(juiceMaker.store.inventory[0].count)"
        bananaStockLabel.text = "\(juiceMaker.store.inventory[1].count)"
        pineappleStockLabel.text = "\(juiceMaker.store.inventory[2].count)"
        kiwiStockLabel.text = "\(juiceMaker.store.inventory[3].count)"
        mangoStockLabel.text = "\(juiceMaker.store.inventory[4].count)"
    }
    
    func showSuccessAlert(message: String) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func showLackOfStockAlert(message: String) {
        guard let editStockViewController = self.storyboard?.instantiateViewController(identifier: "EditStockNavigation") else {
            return
        }
        
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "재고 수정",
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
    
    func makeJuice(juiceName: JuiceName) {
        do {
            try juiceMaker.make(juiceName: juiceName)
            initializeLabel()
            showSuccessAlert(message: "\(juiceName.kor) 나왔습니다! 맛있게 드세요!")
        } catch FruitStoreError.lackOfStock(let count) {
            let description = FruitStoreError.lackOfStock(neededStock: count).description
            showLackOfStockAlert(message: description)
        } catch {
            print(error)
        }
    }
    
    @IBAction func tapStrawberryBananaJuiceButton(_ sender: UIButton) {
        makeJuice(juiceName: .strawberryBananaJuice)
    }
    @IBAction func tapMangoKiwiJuiceButton(_ sender: UIButton) {
        makeJuice(juiceName: .mangoKiwiJuice)
    }
    @IBAction func tapStrawberryJuiceButton(_ sender: UIButton) {
        makeJuice(juiceName: .strawberryJuice)
    }
    @IBAction func tapBananaJuiceButton(_ sender: UIButton) {
        makeJuice(juiceName: .bananaJuice)
    }
    @IBAction func tapPineappleJuiceButton(_ sender: UIButton) {
        makeJuice(juiceName: .pineappleJuice)
    }
    @IBAction func tapKiwiJuiceButton(_ sender: UIButton) {
        makeJuice(juiceName: .kiwiJuice)
    }
    @IBAction func tapMangoJuiceButton(_ sender: UIButton) {
        makeJuice(juiceName: .mangoJuice)
    }
    
}

