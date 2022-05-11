import UIKit

final class EditFruitsViewController: UIViewController {
    @IBOutlet weak private var dismissButton: UIBarButtonItem!
    
    @IBOutlet weak private var strawberryLabel: UILabel!
    @IBOutlet weak private var bananaLabel: UILabel!
    @IBOutlet weak private var pineappleLabel: UILabel!
    @IBOutlet weak private var kiwiLabel: UILabel!
    @IBOutlet weak private var mangoLabel: UILabel!
        
    @IBOutlet weak private var strawberryStepper: UIStepper!
    @IBOutlet weak private var bananaStepper: UIStepper!
    @IBOutlet weak private var pineappleStepper: UIStepper!
    @IBOutlet weak private var kiwiStepper: UIStepper!
    @IBOutlet weak private var mangoStepper: UIStepper!
    
    var fruits: Fruits?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        strawberryStepper.value = Double(fruits?[.strawberry] ?? 0)
        bananaStepper.value = Double(fruits?[.banana] ?? 0)
        pineappleStepper.value = Double(fruits?[.pineapple] ?? 0)
        kiwiStepper.value = Double(fruits?[.kiwi] ?? 0)
        mangoStepper.value = Double(fruits?[.mango] ?? 0)
        
        setNewValue()
    }
    
    private func setNewValue() {
        strawberryLabel.text = Int(strawberryStepper.value).description
        bananaLabel.text = Int(bananaStepper.value).description
        pineappleLabel.text = Int(pineappleStepper.value).description
        kiwiLabel.text = Int(kiwiStepper.value).description
        mangoLabel.text = Int(mangoStepper.value).description
        
        fruits?[.strawberry] = Int(strawberryStepper.value)
        fruits?[.banana] = Int(bananaStepper.value)
        fruits?[.pineapple] = Int(pineappleStepper.value)
        fruits?[.kiwi] = Int(kiwiStepper.value)
        fruits?[.mango] = Int(mangoStepper.value)
    }
    
    @IBAction private func pressStepper(_ sender: UIStepper) {
        setNewValue()
        NotificationCenter.default.post(
            name: NSNotification.Name.fruitsTag,
            object: nil,
            userInfo: ["stocks": fruits ?? [:]]
        )
    }
    
    @IBAction private func dismissViewController(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
