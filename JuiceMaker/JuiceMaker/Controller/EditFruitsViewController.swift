import UIKit

final class EditFruitsViewController: UIViewController {
    @IBOutlet weak var dismissButton: UIBarButtonItem!
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
        
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
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
    
    @IBAction func pressStepper(_ sender: UIStepper) {
        setNewValue()
    }
    
    @IBAction func dismissViewController(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
