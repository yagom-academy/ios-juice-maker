import UIKit

class StockManagerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressedCloseButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
