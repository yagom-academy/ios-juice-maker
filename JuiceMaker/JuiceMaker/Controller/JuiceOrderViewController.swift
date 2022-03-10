import UIKit

protocol JuiceOrderViewControllerDelegate: AnyObject {
    func JuiceOrderViewControllerHasChanges()
}

class JuiceButton: UIButton {
    var juiceType: JuiceMaker.JuiceType?
}

class FruitLabel: UILabel {
    var fruitType: FruitType?
}

class JuiceOrderViewController: UIViewController, JuiceOrderViewControllerDelegate {
    private var juiceMaker = JuiceMaker()
    
    enum MessageNameSpace {
        static let notEnoughStock = "재료가 모자라요. 재고를 수정할까요?"
        static let juiceReady = " 나왔습니다! 맛있게 드세요!"
        static let yes = "예"
        static let no = "아니오"
        static let confirm = "확인"
    }
    
    @IBOutlet var fruitLabels: [FruitLabel]!

    
    @IBOutlet private weak var stockOfStrawberryLabel: FruitLabel!
    @IBOutlet private weak var stockOfBananaLabel: FruitLabel!
    @IBOutlet private weak var stockOfPineappleLabel: FruitLabel!
    @IBOutlet private weak var stockOfKiwiLabel: FruitLabel!
    @IBOutlet private weak var stockOfMangoLabel: FruitLabel!
    
    @IBOutlet private weak var orderStrawberryBananaButton: JuiceButton!
    @IBOutlet private weak var orderMangoKiwiButton: JuiceButton!
    @IBOutlet private weak var orderStrawberryButton: JuiceButton!
    @IBOutlet private weak var orderBananaButton: JuiceButton!
    @IBOutlet private weak var orderPineappleButton: JuiceButton!
    @IBOutlet private weak var orderKiwiButton: JuiceButton!
    @IBOutlet private weak var orderMangoButton: JuiceButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupJuiceButtonType()
        setupFruitLabelType()
        configureFruitStockLabel()
    }
    
    private func setupJuiceButtonType() {
        orderStrawberryBananaButton.juiceType = .strawberryBananaJuice
        orderMangoKiwiButton.juiceType = .mangoKiwiJuice
        orderStrawberryButton.juiceType = .strawberryJuice
        orderBananaButton.juiceType = .bananaJuice
        orderPineappleButton.juiceType = .pineappleJuice
        orderKiwiButton.juiceType = .mangoKiwiJuice
        orderMangoButton.juiceType = .mangoJuice
    }
    
    private func setupFruitLabelType() {
        stockOfStrawberryLabel.fruitType = .strawberry
        stockOfBananaLabel.fruitType = .banana
        stockOfPineappleLabel.fruitType = .pineapple
        stockOfKiwiLabel.fruitType = .kiwi
        stockOfMangoLabel.fruitType = .mango
    }
    
    private func configureFruitStockLabel() {
        fruitLabels.forEach({
            guard let fruitType = $0.fruitType else { return }
            $0.text = String(juiceMaker.fruitStore.numberOfStock(fruit: fruitType))
        })
    }
    
    @IBAction private func orderJuiceAction(_ sender: JuiceButton) {
        guard let orderedJuiceType = sender.juiceType else { return }
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
    
    private func updateFruitStockLabel(recipe: [FruitType: Int]) {
        recipe.forEach {
            let fruitType = $0.key
            fruitLabels.filter({ $0.fruitType == fruitType }).last?.text = String(juiceMaker.fruitStore.numberOfStock(fruit: fruitType))
        }
    }
    
    @IBAction func modifyFruitStockAction(_ sender: UIBarButtonItem) {
        presentStockInventoryView()
    }
    
    private func presentStockInventoryView() {
        guard let stockInventoryViewController = self.storyboard?.instantiateViewController(identifier: ViewName.StockInventoryViewController) as? StockInventoryViewController else { return }
        stockInventoryViewController.fruitStore = juiceMaker.fruitStore
        stockInventoryViewController.delegate = self
        stockInventoryViewController.modalTransitionStyle = .coverVertical
        stockInventoryViewController.modalPresentationStyle = .automatic
        
        self.present(stockInventoryViewController, animated: true)
    }
    
    func JuiceOrderViewControllerHasChanges() {
        configureFruitStockLabel()
    }
}
