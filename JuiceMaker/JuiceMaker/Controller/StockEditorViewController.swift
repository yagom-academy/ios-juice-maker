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
    
    weak static var delegate: DidDissmissDelegate?
    
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
        manageValue(of: Fruit.strawBerry, sender: sender)
    }

    @IBAction func bananaPressed(_ sender: UIStepper) {
        manageValue(of: Fruit.banana, sender: sender)
    }

    @IBAction func pineApplePressed(_ sender: UIStepper) {
        manageValue(of: Fruit.pineApple, sender: sender)
    }

    @IBAction func kiwiPressed(_ sender: UIStepper) {
        manageValue(of: Fruit.kiwi, sender: sender)
    }
    
    @IBAction func mangoPressed(_ sender: UIStepper) {
        manageValue(of: Fruit.mango, sender: sender)
    }
    
    func manageValue(of fruit: Fruit, sender: UIStepper) {
        var fruitLabel: UILabel
        switch fruit {
        case .strawBerry:
            fruitLabel = strawBerryLabel
        case .banana:
            fruitLabel = bananaLabel
        case .pineApple:
            fruitLabel = pineAppleLabel
        case .kiwi:
            fruitLabel = kiwiLabel
        case .mango:
            fruitLabel = mangoLabel
        }
        
        fruitLabel.text = Int(sender.value).description
        myStock.stock.updateValue(Int(sender.value), forKey: fruit.rawValue)
    }
    
    @IBAction func tappedCloseModalButton(_ sender: UIButton) {
        self.dismiss(animated: true)
        StockEditorViewController.delegate?.didDismissModal()
    }
}
