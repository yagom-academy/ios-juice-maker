import UIKit

class EditFruitStockViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationButton()
    }
    
    fileprivate func configureNavigationButton() {
        navigationItem.title = ""
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(hitDoneButton))
    }
    
    @objc
    func hitDoneButton() {
        self.dismiss(animated: true, completion: nil)
    }
}
