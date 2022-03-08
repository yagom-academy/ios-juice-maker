import UIKit

class StockInventoryViewController: UIViewController {
    
    public var fruitsStock: [FruitType: Int] = [:]
    var delegate: dataDelegate?
    
    @IBOutlet private weak var stockOfStrawberryLabel: UILabel!
    @IBOutlet private weak var stockOfBananaLabel: UILabel!
    @IBOutlet private weak var stockOfPineappleLabel: UILabel!
    @IBOutlet private weak var stockOfKiwiLabel: UILabel!
    @IBOutlet private weak var stockOfMangoLabel: UILabel!
    
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    
    
    @IBOutlet var stockLabels: [UILabel]!
    
    
    @IBOutlet var stockSteppers: [UIStepper]!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFruitStockLabel()
        
        strawberryStepper.autorepeat = true
        strawberryStepper.minimumValue = 0
        strawberryStepper.maximumValue = 20
        
        bananaStepper.autorepeat = true
        bananaStepper.minimumValue = 0
        bananaStepper.maximumValue = 20
        
        pineappleStepper.autorepeat = true
        pineappleStepper.minimumValue = 0
        pineappleStepper.maximumValue = 20
        
        kiwiStepper.autorepeat = true
        kiwiStepper.minimumValue = 0
        kiwiStepper.maximumValue = 20
        
        mangoStepper.autorepeat = true
        mangoStepper.minimumValue = 0
        mangoStepper.maximumValue = 20
    }
    
    private func setupFruitStockLabel() {
        stockOfStrawberryLabel.text = String(fruitsStock[FruitType.strawberry] ?? 0)
        stockOfBananaLabel.text = String(fruitsStock[FruitType.banana] ?? 0)
        stockOfPineappleLabel.text = String(fruitsStock[FruitType.pineapple] ?? 0)
        stockOfKiwiLabel.text = String(fruitsStock[FruitType.kiwi] ?? 0)
        stockOfMangoLabel.text = String(fruitsStock[FruitType.mango] ?? 0)
        
        strawberryStepper.value = Double(fruitsStock[FruitType.strawberry] ?? 0)
        bananaStepper.value = Double(fruitsStock[FruitType.banana] ?? 0)
        pineappleStepper.value = Double(fruitsStock[FruitType.pineapple] ?? 0)
        kiwiStepper.value = Double(fruitsStock[FruitType.kiwi] ?? 0)
        mangoStepper.value = Double(fruitsStock[FruitType.mango] ?? 0)
    }
    
    @IBAction func closeManageStockView(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        switch sender {
        case strawberryStepper:
            stockOfStrawberryLabel.text = Int(sender.value).description
        case bananaStepper:
            stockOfBananaLabel.text = Int(sender.value).description
        case pineappleStepper:
            stockOfPineappleLabel.text = Int(sender.value).description
        case kiwiStepper:
            stockOfKiwiLabel.text = Int(sender.value).description
        case mangoStepper:
            stockOfMangoLabel.text = Int(sender.value).description
        default:
            break
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.exchangeData(data: "second view가 보내는 데이터")
    }
    
    
}
