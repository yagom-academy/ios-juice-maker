import UIKit

protocol dataDelegate {
    func exchangeData(data: String)
}

class JuiceOrderViewController: UIViewController {
//    func exchangeData(data: String) {
//        print("ViewController DelegateFunction: \(data)")
//        print("Data: [\(data)]")
//    }
    
    
    private var juiceMaker = JuiceMaker()
    enum MessageNameSpace {
        static let notEnoughStock = "재료가 모자라요. 재고를 수정할까요?"
        static let juiceReady = " 나왔습니다! 맛있게 드세요!"
        static let yes = "예"
        static let no = "아니오"
        static let confirm = "확인"
    }
    
    @IBOutlet private weak var stockOfStrawberryLabel: UILabel!
    @IBOutlet private weak var stockOfBananaLabel: UILabel!
    @IBOutlet private weak var stockOfPineappleLabel: UILabel!
    @IBOutlet private weak var stockOfKiwiLabel: UILabel!
    @IBOutlet private weak var stockOfMangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFruitStockLabel()
    }
    
    @IBOutlet private weak var orderStrawberryBananaButton: UIButton!
    @IBOutlet private weak var orderMangoKiwiButton: UIButton!
    @IBOutlet private weak var orderStrawberryButton: UIButton!
    @IBOutlet private weak var orderBananaButton: UIButton!
    @IBOutlet private weak var orderPineappleButton: UIButton!
    @IBOutlet private weak var orderKiwiButton: UIButton!
    @IBOutlet private weak var orderMangoButton: UIButton!
    
    
    func orderedJuiceType(from button: UIButton) -> JuiceMaker.JuiceType? {
        switch button {
        case orderStrawberryBananaButton:
            return JuiceMaker.JuiceType.strawberryBananaJuice
        case orderMangoKiwiButton:
            return JuiceMaker.JuiceType.mangoKiwiJuice
        case orderStrawberryButton:
            return JuiceMaker.JuiceType.strawberryJuice
        case orderBananaButton:
            return JuiceMaker.JuiceType.bananaJuice
        case orderPineappleButton:
            return JuiceMaker.JuiceType.pineappleJuice
        case orderKiwiButton:
            return JuiceMaker.JuiceType.kiwiJuice
        case orderMangoButton:
            return JuiceMaker.JuiceType.mangoJuice
        default:
            return nil
        }
    }
    
    @IBAction private func orderJuiceAction(_ sender: UIButton) {
        guard let orderedJuiceType = orderedJuiceType(from: sender) else { return }
        do {
            let juice = try juiceMaker.makeJuice(juice: orderedJuiceType)
            showJuiceReadyAlert(juiceName: juice.name())
            updateFruitStockLabel(recipe: juice.recipe())
        } catch {
            showNotEnoughStockAlert()
        }
    }
    
    private func showNotEnoughStockAlert() {
        let alertController = UIAlertController(title: MessageNameSpace.notEnoughStock, message: nil, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: MessageNameSpace.yes, style: .default, handler: {
            [weak self] _ in self?.presentStockInventoryView()
        })
        let noAction = UIAlertAction(title: MessageNameSpace.no, style: .cancel, handler: nil)
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        present(alertController, animated: false, completion: nil)
    }
    
    private func showJuiceReadyAlert(juiceName: String) {
        let alertController = UIAlertController(title: juiceName +  MessageNameSpace.juiceReady, message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: MessageNameSpace.confirm, style: .default, handler: nil)
        alertController.addAction(confirmAction)
        present(alertController, animated: false, completion: nil)
    }
    
    private func setupFruitStockLabel() {
        stockOfStrawberryLabel.text = String(juiceMaker.fruitStore.numberOfStock(fruit: FruitType.strawberry))
        stockOfBananaLabel.text = String(juiceMaker.fruitStore.numberOfStock(fruit: FruitType.banana))
        stockOfPineappleLabel.text = String(juiceMaker.fruitStore.numberOfStock(fruit: FruitType.pineapple))
        stockOfKiwiLabel.text = String(juiceMaker.fruitStore.numberOfStock(fruit: FruitType.kiwi))
        stockOfMangoLabel.text = String(juiceMaker.fruitStore.numberOfStock(fruit: FruitType.mango))
    }
    
    private func updateFruitStockLabel(recipe: [FruitType: Int]) {
        recipe.forEach {
            switch $0.key {
            case FruitType.strawberry:
                stockOfStrawberryLabel.text = String(juiceMaker.fruitStore.numberOfStock(fruit: FruitType.strawberry))
            case FruitType.banana:
                stockOfBananaLabel.text = String(juiceMaker.fruitStore.numberOfStock(fruit: FruitType.banana))
            case FruitType.pineapple:
                stockOfPineappleLabel.text = String(juiceMaker.fruitStore.numberOfStock(fruit: FruitType.pineapple))
            case FruitType.kiwi:
                stockOfKiwiLabel.text = String(juiceMaker.fruitStore.numberOfStock(fruit: FruitType.kiwi))
            case FruitType.mango:
                stockOfMangoLabel.text = String(juiceMaker.fruitStore.numberOfStock(fruit: FruitType.mango))
            }
        }
    }
    
    @IBAction func modifyFruitStockAction(_ sender: UIBarButtonItem) {
        presentStockInventoryView()
    }

    private func presentStockInventoryView() {
        guard let stockInventoryViewController = self.storyboard?.instantiateViewController(identifier: ViewName.StockInventoryViewController) else { return }
        stockInventoryViewController.modalTransitionStyle = .coverVertical
        stockInventoryViewController.modalPresentationStyle = .automatic
        
        self.present(stockInventoryViewController, animated: true)

        
    }
}

