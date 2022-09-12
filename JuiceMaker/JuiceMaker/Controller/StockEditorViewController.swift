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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelVal()
    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        print(myStock.stock)
//    }
//
    
    func setLabelVal() {
        strawBerryLabel.text = myStock.stock["딸기"]?.description
        bananaLabel.text = myStock.stock["바나나"]?.description
        pineAppleLabel.text = myStock.stock["파인애플"]?.description
        kiwiLabel.text = myStock.stock["키위"]?.description
        mangoLabel.text = myStock.stock["망고"]?.description
    }
    
    @IBAction func closeModal(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

