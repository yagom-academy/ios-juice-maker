import Foundation
import UIKit

class ManageStockViewController:
    
    UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeManageStockView(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
