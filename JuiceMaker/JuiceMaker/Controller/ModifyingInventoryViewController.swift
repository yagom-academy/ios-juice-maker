import UIKit

class ModifyingInventoryViewController: UIViewController {
    static let identifier: String = "ModifyingInventoryViewController"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpCloseButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
