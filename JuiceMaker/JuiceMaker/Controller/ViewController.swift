import UIKit

class ViewController: UIViewController {

    @IBOutlet var stockLabelCollection: [UILabel]!

    private var juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStock()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateStock()
    }

    private func updateStock() {
        for (stockLabel, fruit) in zip(stockLabelCollection, Fruit.allCases) {
            stockLabel.text = juiceMaker.stockCount(of: fruit)
        }
    }
    
    private func showCompleteAlert(juice: Menu) {
        let completeAlert = UIAlertController(title: "쥬스 제조 완료", message: "\(juice.juiceName) 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)

        completeAlert.addAction(UIAlertAction(title: "확인", style: .default))
        
        present(completeAlert, animated: true)
    }
    
    private func showOutOfStockAlert() {
        let outOfStockAlert = UIAlertController(title: "재료 소진", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default) { action in
            guard let stockView = self.storyboard?.instantiateViewController(withIdentifier: "StockViewController") as? FruitStockViewController else { return }
            
            stockView.fruitStore = self.juiceMaker.fruitStore
            
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
            stockViewController.fruitStore = juiceMaker.fruitStore
        }
    }
}

