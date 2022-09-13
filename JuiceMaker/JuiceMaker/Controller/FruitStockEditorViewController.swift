//  Created by 애종,질리,벨라 on 2022/09/06.

import UIKit

class FruitStockEditorViewController: UIViewController {

    @IBOutlet weak var mutableStrawberryAmountLabel: UILabel!
    @IBOutlet weak var mutableBananaAmountLabel: UILabel!
    @IBOutlet weak var mutablePineappleAmountLabel: UILabel!
    @IBOutlet weak var mutableKiwiAmountLabel: UILabel!
    @IBOutlet weak var mutableMangoAmountLabel: UILabel!
    
    @IBOutlet weak var strawberryAmountStepper: UIStepper!
    @IBOutlet weak var bananaAmountStepper: UIStepper!
    @IBOutlet weak var pineappleAmountStepper: UIStepper!
    @IBOutlet weak var kiwiAmountStepper: UIStepper!
    @IBOutlet weak var mangoAmountStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchupStrawberryAmountStepper(_ sender: UIStepper) {
        
    }
    
    @IBAction func touchupBananaAmountStepper(_ sender: UIStepper) {
        
    }
    
    @IBAction func touchupPineappleAmountStepper(_ sender: UIStepper) {
        
    }
    
    @IBAction func touchupKiwiAmountStepper(_ sender: UIStepper) {
        
    }
    
    @IBAction func touchupMangoAmountStepper(_ sender: UIStepper) {
        
    }
}
