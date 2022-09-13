import UIKit

class ModifyFruitsStockViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(showCount),
            name: Notification.Name("showFruitCount"),
            object: nil)
    }
    
    @objc func showCount(list: Notification) {
        print(list.object)
    }
    
    @IBAction func touchUpDismissButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
