import UIKit

final class FruitStoreViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpDissmisButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
