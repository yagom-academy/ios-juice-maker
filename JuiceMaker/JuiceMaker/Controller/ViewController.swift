import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!

    private var juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStock()
    }

    private func updateStock() {
        strawberryStockLabel.text = juiceMaker.stockCount(of: .strawberry)
        bananaStockLabel.text = juiceMaker.stockCount(of: .banana)
        pineappleStockLabel.text = juiceMaker.stockCount(of: .pineapple)
        kiwiStockLabel.text = juiceMaker.stockCount(of: .kiwi)
        mangoStockLabel.text = juiceMaker.stockCount(of: .mango)
    }
    
    private func showCompleteAlert(juice: Menu) {
        let completeAlert = UIAlertController(title: "쥬스 제조 완료", message: "\(juice.juiceName) 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "확인", style: .default)
        
        completeAlert.addAction(yesAction)
        
        present(completeAlert, animated: true)
    }
    
    private func showOutOfStockAlert() {
        let outOfStockAlert = UIAlertController(title: "재료 소진", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default) { action in
            guard let stockView = self.storyboard?.instantiateViewController(withIdentifier: "StockViewController") as? FruitStockViewController else { return }
            
            stockView.stocks = self.juiceMaker.remainStock()
            
            self.navigationController?.pushViewController(stockView, animated: true)
        }
        let noAction = UIAlertAction(title: "아니요", style: .cancel)
        
        [yesAction, noAction].forEach { outOfStockAlert.addAction($0) }
        
        present(outOfStockAlert, animated: true)
    }
    
    @IBAction func orderJuiceButtonTapped(sender: UIButton) {
        guard let juiceMenu = Menu(rawValue: sender.tag) else { return }
    
        do{
            try juiceMaker.make(juiceMenu: juiceMenu)
        } catch JuiceMakerError.outOfStock {
            showOutOfStockAlert()
        } catch {
            print("알 수 없는 에러입니다.")
        }
        
        showCompleteAlert(juice: juiceMenu)
        updateStock()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stockViewSegue" {
            guard let stockViewController =  segue.destination as? FruitStockViewController else { return }
            stockViewController.stocks = juiceMaker.remainStock()
        }
    }
    
}

