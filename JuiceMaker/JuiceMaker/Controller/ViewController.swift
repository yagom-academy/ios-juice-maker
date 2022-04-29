import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var StrawberryStockLabel: UILabel!
    @IBOutlet weak var BananaStockLabel: UILabel!
    @IBOutlet weak var PineappleStockLabel: UILabel!
    @IBOutlet weak var KiwiStockLabel: UILabel!
    @IBOutlet weak var MangoStockLabel: UILabel!

    private var store = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStock()
    }

    private func updateStock() {
        StrawberryStockLabel.text = store.stockCount(of: .strawberry)
        BananaStockLabel.text = store.stockCount(of: .banana)
        PineappleStockLabel.text = store.stockCount(of: .pineapple)
        KiwiStockLabel.text = store.stockCount(of: .kiwi)
        MangoStockLabel.text = store.stockCount(of: .mango)
    }
    
    func showCompleteAlert(juice: String) {
        
        let completeAlert = UIAlertController(title: "쥬스 제조 완료", message: "\(juice) 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "확인", style: .default)
        
        completeAlert.addAction(yesAction)
        
        present(completeAlert, animated: true)
        
    }
    
    @IBAction func orderJuice(sender: UIButton) {
        
        guard let juiceMenu = Menu(rawValue: sender.tag) else { return }
    
        do{
            try store.make(juiceMenu: juiceMenu)
        } catch JuiceMakerError.outOfStock {
            print("재고가 부족합니다.")
        } catch {
            print("알 수 없는 에러입니다.")
        }
        
        showCompleteAlert(juice: juiceMenu.juiceName)
        updateStock()
    }
    
}

