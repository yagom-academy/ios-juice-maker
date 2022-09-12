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
        strawBerryLabel.text = myStock.stock["딸기"]?.description
        bananaLabel.text = myStock.stock["바나나"]?.description
        pineAppleLabel.text = myStock.stock["파인애플"]?.description
        kiwiLabel.text = myStock.stock["키위"]?.description
        mangoLabel.text = myStock.stock["망고"]?.description
    }
    
    func setStepperValue() {
        if let strawBerry = myStock.stock["딸기"] { strawberryStepper.value = Double(strawBerry) }
        if let banana = myStock.stock["바나나"] { bananaStepper.value = Double(banana) }
        if let pineApple = myStock.stock["파인애플"] { pineAppleStepper.value = Double(pineApple) }
        if let kiwi = myStock.stock["키위"] { kiwiStepper.value = Double(kiwi) }
        if let mango = myStock.stock["망고"] { mangoStepper.value = Double(mango) }
    }
    
    @IBAction func strawberryPressed(_ sender: UIStepper) {
        manageValue(of: "딸기", and: strawBerryLabel, with: sender)
    }

    @IBAction func bananaPressed(_ sender: UIStepper) {
        manageValue(of: "바나나", and: bananaLabel, with: sender)
    }

    @IBAction func pineApplePressed(_ sender: UIStepper) {
        manageValue(of: "파인애플", and: pineAppleLabel, with: sender)
    }

    @IBAction func kiwiPressed(_ sender: UIStepper) {
        manageValue(of: "키위", and: kiwiLabel, with: sender)
    }
    
    @IBAction func mangoPressed(_ sender: UIStepper) {
        manageValue(of: "망고", and: mangoLabel, with: sender)
    }
    
    func manageValue(of fruit: String, and label: UILabel, with sender: UIStepper) {
        label.text = Int(sender.value).description
        myStock.stock.updateValue(Int(sender.value), forKey: fruit)
    }
    
    @IBAction func tappedCloseModalButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
