import UIKit

class StockInventoryViewController: UIViewController {
    
    public var data: String = ""
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("data: \(data)")
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
        stockOfStrawberryLabel.text = "10"
        stockOfBananaLabel.text = "10"
        stockOfPineappleLabel.text = "10"
        stockOfKiwiLabel.text = "10"
        stockOfMangoLabel.text = "10"
        
        strawberryStepper.value = 10
        bananaStepper.value = 10
        pineappleStepper.value = 10
        kiwiStepper.value = 10
        mangoStepper.value = 10
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
