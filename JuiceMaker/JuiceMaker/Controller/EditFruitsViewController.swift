import UIKit

final class EditFruitsViewController: UIViewController {
    @IBOutlet weak var dismissButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dismissView(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}
