import UIKit

class FruitStockViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        strawberryStockLabel.text = String(FruitStore.sharedFruitStore.fetchStockOf(.strawberry))
        bananaStockLabel.text = String(FruitStore.sharedFruitStore.fetchStockOf(.banana))
        pineappleStockLabel.text = String(FruitStore.sharedFruitStore.fetchStockOf(.pineapple))
        kiwiStockLabel.text = String(FruitStore.sharedFruitStore.fetchStockOf(.kiwi))
        mangoStockLabel.text = String(FruitStore.sharedFruitStore.fetchStockOf(.mango))
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
