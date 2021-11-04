
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
        for i in 0..<fruitStock.count {
            stepperValue.append(Double(fruitStock[i]) ?? .zero)
        }
        strawberryStepper.value = stepperValue[0]
        bananaStepper.value = stepperValue[1]
        mangoStepper.value = stepperValue[2]
        kiwiStepper.value = stepperValue[3]
        pineappleStepper.value = stepperValue[4]
        stepperValue = []
    }
    
    @IBAction func completeModifyButton(_ sender: UIButton) {
        transmitStepperValueToFruitStock()
        dismiss(animated: true, completion: nil)
    }
    
    func transmitStepperValueToFruitStock() {
        stepperValue.append(strawberryStepper.value)
        stepperValue.append(bananaStepper.value)
        stepperValue.append(mangoStepper.value)
        stepperValue.append(kiwiStepper.value)
        stepperValue.append(pineappleStepper.value)
        FruitStore.shared.changeFruitStock(stepperValue: stepperValue)
    }
    
    
    @IBAction func touchUpStepper(_ sender: UIStepper) {
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
