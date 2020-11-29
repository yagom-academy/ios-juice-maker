import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    let juiceMaker = JuiceMaker(stock: FruitStock(strawberry: 10, banana: 10, pineapple: 10, kiwii: 10, mango: 10))
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureStockLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBActions
    @IBAction func orderStrawberryBanana(_ sender: Any) {
        orderJuice(with: [.strawberry: 10, .banana: 1], juiceName: "딸바")
    }
    @IBAction func orderMangoKiwii(_ sender: UIButton) {
        orderJuice(with: [.mango: 2, .kiwii: 1], juiceName: "망고키위")
    }
    @IBAction func orderStrawberry(_ sender: UIButton) {
        orderJuice(with: [.strawberry: 16], juiceName: "딸기")
    }
    @IBAction func orderBanana(_ sender: UIButton) {
        orderJuice(with: [.banana: 2], juiceName: "바나나")
    }
    @IBAction func orderPineApple(_ sender: UIButton) {
        orderJuice(with: [.pineapple: 2], juiceName: "파인애플")
    }
    @IBAction func orderKiwii(_ sender: UIButton) {
        orderJuice(with: [.kiwii: 3], juiceName: "키위")
    }
    @IBAction func orderMango(_ sender: UIButton) {
        orderJuice(with: [.mango: 3], juiceName: "망고")
    }
    
    private func orderJuice(with recipe: Recipe, juiceName: String) {
        juiceMaker.makeJuice(with: recipe) { (result) in
            switch result {
            case .success(let message):
                let alert = UIAlertController(title: "성공!", message: "\(juiceName)\(message)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                configureStockLabel()
            case .failure(_):
                let alert = UIAlertController(title: "실패!", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "예", style: .default, handler: { (_) in
                    self.performSegue(withIdentifier: "EditStockSegue", sender: self)
                }))
                alert.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    //StockLabel 수정.
    private func configureStockLabel() {
        strawberryStock.text = "\(juiceMaker.fruitStock.strawberry)"
        bananaStock.text = "\(juiceMaker.fruitStock.banana)"
        pineappleStock.text = "\(juiceMaker.fruitStock.pineapple)"
        kiwiiStock.text = "\(juiceMaker.fruitStock.kiwii)"
        mangoStock.text = "\(juiceMaker.fruitStock.mango)"
    }
}

