//
//  Created by Baem, Jeremy
//
//
import UIKit

class StockEditorViewController: UIViewController {
    var myStock = JuiceMaker.sharedStore

    @IBOutlet weak var strawBerryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineAppleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineAppleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelValue()
        setStepperValue()
    }
    
    func setLabelValue() {
        strawBerryLabel.text = myStock.stock[Fruit.strawBerry.rawValue]?.description
        bananaLabel.text = myStock.stock[Fruit.banana.rawValue]?.description
        pineAppleLabel.text = myStock.stock[Fruit.pineApple.rawValue]?.description
        kiwiLabel.text = myStock.stock[Fruit.kiwi.rawValue]?.description
        mangoLabel.text = myStock.stock[Fruit.mango.rawValue]?.description
    }
    
    func setStepperValue() {
        if let strawBerry = myStock.stock[Fruit.strawBerry.rawValue] { strawberryStepper.value = Double(strawBerry) }
        if let banana = myStock.stock[Fruit.banana.rawValue] { bananaStepper.value = Double(banana) }
        if let pineApple = myStock.stock[Fruit.pineApple.rawValue] { pineAppleStepper.value = Double(pineApple) }
        if let kiwi = myStock.stock[Fruit.kiwi.rawValue] { kiwiStepper.value = Double(kiwi) }
        if let mango = myStock.stock[Fruit.mango.rawValue] { mangoStepper.value = Double(mango) }
    }
    
    @IBAction func strawberryPressed(_ sender: UIStepper) {
        manageValue(of: Fruit.strawBerry.rawValue, and: strawBerryLabel, with: sender)
    }

    @IBAction func bananaPressed(_ sender: UIStepper) {
        manageValue(of: Fruit.banana.rawValue, and: bananaLabel, with: sender)
    }

    @IBAction func pineApplePressed(_ sender: UIStepper) {
        manageValue(of: Fruit.pineApple.rawValue, and: pineAppleLabel, with: sender)
    }

    @IBAction func kiwiPressed(_ sender: UIStepper) {
        manageValue(of: Fruit.kiwi.rawValue, and: kiwiLabel, with: sender)
    }
    
    @IBAction func mangoPressed(_ sender: UIStepper) {
        manageValue(of: Fruit.mango.rawValue, and: mangoLabel, with: sender)
    }
    
    func manageValue(of fruit: String, and label: UILabel, with sender: UIStepper) {
        label.text = Int(sender.value).description
        myStock.stock.updateValue(Int(sender.value), forKey: fruit)
    }
    
    @IBAction func tappedCloseModalButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
