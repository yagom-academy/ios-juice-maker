import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblStrawberryStock: UILabel!
    @IBOutlet weak var lblBananaStock: UILabel!
    @IBOutlet weak var lblPineappleStock: UILabel!
    @IBOutlet weak var lblKiwiStock: UILabel!
    @IBOutlet weak var lblMangoStock: UILabel!

    var order: JuiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showStock()
    }

    func showStock() {
        lblStrawberryStock.text = order.fruitStore.convertToString(fruit: .strawberry)
        lblBananaStock.text = order.fruitStore.convertToString(fruit: .banana)
        lblPineappleStock.text = order.fruitStore.convertToString(fruit: .pineapple)
        lblKiwiStock.text = order.fruitStore.convertToString(fruit: .kiwi)
        lblMangoStock.text = order.fruitStore.convertToString(fruit: .mango)
    }
    
    @IBAction func orderJuice(sender: UIButton) {
        
        guard let orderedMenu = sender.restorationIdentifier else {
            return
        }
        
        let juiceMenu: Menu? = Menu(rawValue: orderedMenu)
    
        do{
            try order.makeJuice(what: juiceMenu)
        } catch ThrowError.outOfStock {
            print("재고가 부족합니다.")
        } catch ThrowError.invalidMenu {
            print("유효하지 않은 주문입니다.")
        } catch {
            print("알 수 없는 에러입니다.")
        }
        
        showStock()
    }
    
}

