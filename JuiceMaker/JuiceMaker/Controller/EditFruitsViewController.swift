import UIKit

final class EditFruitsViewController: UIViewController {
    @IBOutlet weak private var dismissButton: UIBarButtonItem!
    
    @IBOutlet weak private var strawberryCountLabel: UILabel!
    @IBOutlet weak private var bananaCountLabel: UILabel!
    @IBOutlet weak private var pineappleCountLabel: UILabel!
    @IBOutlet weak private var kiwiCountLabel: UILabel!
    @IBOutlet weak private var mangoCountLabel: UILabel!
        
    @IBOutlet weak private var strawberryCountStepper: UIStepper!
    @IBOutlet weak private var bananaCountStepper: UIStepper!
    @IBOutlet weak private var pineappleCountStepper: UIStepper!
    @IBOutlet weak private var kiwiCountStepper: UIStepper!
    @IBOutlet weak private var mangoCountStepper: UIStepper!
    
    var fruits: Fruits?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFruitsCountSteppers()
        setupFruitsCountLabels()
    }
    
    private func setupFruitsCountSteppers() {
        strawberryCountStepper.value = Double(fruits?[.strawberry] ?? 0)
        bananaCountStepper.value = Double(fruits?[.banana] ?? 0)
        pineappleCountStepper.value = Double(fruits?[.pineapple] ?? 0)
        kiwiCountStepper.value = Double(fruits?[.kiwi] ?? 0)
        mangoCountStepper.value = Double(fruits?[.mango] ?? 0)
    }
    
    private func setupFruitsCountLabels() {
        strawberryCountLabel.text = Int(strawberryCountStepper.value).description
        bananaCountLabel.text = Int(bananaCountStepper.value).description
        pineappleCountLabel.text = Int(pineappleCountStepper.value).description
        kiwiCountLabel.text = Int(kiwiCountStepper.value).description
        mangoCountLabel.text = Int(mangoCountStepper.value).description
    }
    
    @IBAction private func pressStepper(_ sender: UIStepper) {
        setNewValue(sender)
        NotificationCenter.default.post(
            name: NSNotification.Name.fruitsTag,
            object: nil,
            userInfo: [Constant.userInfoKey: fruits ?? [:]]
        )
    }
    
    private func setNewValue(_ stepper: UIStepper) {
        switch stepper {
        case strawberryCountStepper:
            let strawberryValue = Int(strawberryCountStepper.value)
            refreshFruitCountLabels(stepper, value: strawberryValue)
            fruits?[.strawberry] = strawberryValue
        case bananaCountStepper:
            let bananaValue = Int(bananaCountStepper.value)
            refreshFruitCountLabels(stepper, value: bananaValue)
            fruits?[.banana] = bananaValue
        case pineappleCountStepper:
            let pineappleValue = Int(pineappleCountStepper.value)
            refreshFruitCountLabels(stepper, value: pineappleValue)
            fruits?[.pineapple] = pineappleValue
        case kiwiCountStepper:
            let kiwiValue = Int(kiwiCountStepper.value)
            refreshFruitCountLabels(stepper, value: kiwiValue)
            fruits?[.kiwi] = kiwiValue
        case mangoCountStepper:
            let mangoValue = Int(mangoCountStepper.value)
            refreshFruitCountLabels(stepper, value: mangoValue)
            fruits?[.mango] = mangoValue
        default:
            return
        }
    }
    
    private func refreshFruitCountLabels(_ stepper: UIStepper, value: Int) {
        switch stepper {
        case strawberryCountStepper:
            strawberryCountLabel.text = value.description
        case bananaCountStepper:
            bananaCountLabel.text = value.description
        case pineappleCountStepper:
            pineappleCountLabel.text = value.description
        case kiwiCountStepper:
            kiwiCountLabel.text = value.description
        case mangoCountStepper:
            mangoCountLabel.text = value.description
        default:
            return
        }
    }
    
    @IBAction private func dismissViewController(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
