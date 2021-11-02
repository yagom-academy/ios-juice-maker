
import UIKit

class FruitStorageViewController: UIViewController {

    var fruitStock: [String] = []
    var stepperValue: [Double] = []
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        setFruitStockLabel()
        setDefaultStepperValue()
    }
    
    func setFruitStockLabel() {
        strawberryStockLabel.text = fruitStock[0]
        bananaStockLabel.text = fruitStock[1]
        mangoStockLabel.text = fruitStock[2]
        kiwiStockLabel.text = fruitStock[3]
        pineappleStockLabel.text = fruitStock[4]
    }

    func setDefaultStepperValue() {
        for i in 0...fruitStock.count - 1 {
            stepperValue.append(Double(fruitStock[i]) ?? 0)
        }
        strawberryStepper.value = stepperValue[0]
        bananaStepper.value = stepperValue[1]
        mangoStepper.value = stepperValue[2]
        kiwiStepper.value = stepperValue[3]
        pineappleStepper.value = stepperValue[4]
    }
    
    @IBAction func completeModifyButton(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func stepperTest(_ sender: UIStepper) {
        switch sender {
        case strawberryStepper:
            strawberryStockLabel.text = Int(strawberryStepper.value).description
        case bananaStepper:
            bananaStockLabel.text = Int(bananaStepper.value).description
        case mangoStepper:
            mangoStockLabel.text = Int(mangoStepper.value).description
        case kiwiStepper:
            kiwiStockLabel.text = Int(kiwiStepper.value).description
        case pineappleStepper:
            pineappleStockLabel.text = Int(pineappleStepper.value).description
        default:
            return
        }
    }
}
