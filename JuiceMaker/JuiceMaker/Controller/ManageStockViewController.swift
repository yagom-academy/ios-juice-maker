import Foundation
import UIKit

class ManageStockViewController:
    
    UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeManageStockView(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
