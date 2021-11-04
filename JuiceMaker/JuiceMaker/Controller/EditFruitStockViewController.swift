import UIKit

class EditFruitStockViewController: UIViewController {
    private var fruitStore: FruitStore?
    
    @IBOutlet var stockOfStrawberryLabel: UILabel!
    @IBOutlet var stockOfBananaLabel: UILabel!
    @IBOutlet var stockOfPineappleLabel: UILabel!
    @IBOutlet var stockOfKiwiLabel: UILabel!
    @IBOutlet var stockOfMangoLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationButton()
        updateStockLabel()
        strawberryStepper.value = Double(fruitStore?.fruitStock[.strawberry] ?? 0)
        bananaStepper.value = Double(fruitStore?.fruitStock[.banana] ?? 0)
        pineappleStepper.value = Double(fruitStore?.fruitStock[.pineapple] ?? 0)
        kiwiStepper.value = Double(fruitStore?.fruitStock[.kiwi] ?? 0)
        mangoStepper.value = Double(fruitStore?.fruitStock[.mango] ?? 0)
    }
    
    private func updateStockLabel() {
        let stringOfFruitStock: [Fruit: String]? = fruitStore?.fruitStock.mapValues { String($0) }
        guard let currentStock = stringOfFruitStock else {
            return
        }
        for (fruit, stock) in currentStock {
            switch fruit {
            case .strawberry:
                stockOfStrawberryLabel.text = stock
            case .banana:
                stockOfBananaLabel.text = stock
            case .pineapple:
                stockOfPineappleLabel.text = stock
            case .kiwi:
                stockOfKiwiLabel.text = stock
            case .mango:
                stockOfMangoLabel.text = stock
            }
        }
    }
    
    fileprivate func configureNavigationButton() {
        navigationItem.title = "재고 추가"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "닫기", style: .done, target: self, action: #selector(hitDoneButton))
    }
    
    @objc
    func hitDoneButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func configure(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    @IBAction func hitStrawberryStepper(_ sender: UIStepper) {
        let value = Int(strawberryStepper.value)
        fruitStore?.changeQuantity(of: .strawberry, to: value)
        stockOfStrawberryLabel.text = String(value)
    }
    @IBAction func hitBananaStepper(_ sender: UIStepper) {
        let value = Int(bananaStepper.value)
        fruitStore?.changeQuantity(of: .banana, to: value)
        stockOfBananaLabel.text = String(value)
    }
    @IBAction func hitPineappleStepper(_ sender: UIStepper) {
        let value = Int(pineappleStepper.value)
        fruitStore?.changeQuantity(of: .pineapple, to: value)
        stockOfPineappleLabel.text = String(value)
    }
    @IBAction func hitKiwiStepper(_ sender: UIStepper) {
        let value = Int(kiwiStepper.value)
        fruitStore?.changeQuantity(of: .kiwi, to: value)
        stockOfKiwiLabel.text = String(value)
    }
    @IBAction func hitMangoStepper(_ sender: UIStepper) {
        let value = Int(mangoStepper.value)
        fruitStore?.changeQuantity(of: .mango, to: value)
        stockOfMangoLabel.text = String(value)
    }
    
}
