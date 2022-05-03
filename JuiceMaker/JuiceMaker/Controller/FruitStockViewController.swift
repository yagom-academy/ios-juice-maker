import UIKit

class FruitStockViewController: UIViewController {

    var stocks: [Fruit: Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(stocks)
    }

    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}
