import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var StrawberryStockLabel: UILabel!
    @IBOutlet weak var BananaStockLabel: UILabel!
    @IBOutlet weak var PineappleStockLabel: UILabel!
    @IBOutlet weak var KiwiStockLabel: UILabel!
    @IBOutlet weak var MangoStockLabel: UILabel!

    private var juiceMachine = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStock()
    }

    private func updateStock() {
        StrawberryStockLabel.text = juiceMachine.fruitStore.stockCount(fruit: .strawberry)
        BananaStockLabel.text = juiceMachine.fruitStore.stockCount(fruit: .banana)
        PineappleStockLabel.text = juiceMachine.fruitStore.stockCount(fruit: .pineapple)
        KiwiStockLabel.text = juiceMachine.fruitStore.stockCount(fruit: .kiwi)
        MangoStockLabel.text = juiceMachine.fruitStore.stockCount(fruit: .mango)
    }
    
    @IBAction func orderJuice(sender: UIButton) {
        
        guard let juiceMenu = Menu(rawValue: sender.tag) else { return }
    
        do{
            try juiceMachine.make(juice: juiceMenu)
        } catch JuiceMakerError.outOfStock {
            print("재고가 부족합니다.")
        } catch {
            print("알 수 없는 에러입니다.")
        }
        
        updateStock()
    }
    
}

