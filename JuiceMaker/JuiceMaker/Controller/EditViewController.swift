import UIKit

class EditViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = ""
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTrigger))
    }
    
    @objc
    func doneButtonTrigger() {
        self.dismiss(animated: true, completion: nil)
    }

}
