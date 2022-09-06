import UIKit

class ViewController: UIViewController {
    
    @IBAction func touchUpStrawberryJuiceOrder(_ sender: UIButton) {
        if(JuiceMaker.shared.takeAnOrder(fruitJuice: .strawberryJuice)) {
            showJuiceComeOutAlert(fruitJuice: .strawberryJuice)
        } else {
            showFruitsOutOfStockAlert()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func showJuiceComeOutAlert(fruitJuice: FruitJuice) {
        let alert = UIAlertController(title: nil,
                                      message: "\(fruitJuice) 쥬스 나왔습니다! 맛있게 드세요!",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "예", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    func showFruitsOutOfStockAlert() {
        let alert = UIAlertController(title: nil,
                                      message: "재료가 모자라요. 재고를 수정할까요?",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .default) { _ in
            let storyboard: UIStoryboard? = UIStoryboard(name: "Main", bundle: Bundle.main)
            guard let vc = storyboard?.instantiateViewController(identifier: "modifyFruitVC") else {
                return
            }
            self.present(vc, animated: true, completion: nil)
            
        }
        let cancleAction = UIAlertAction(title: "아니오", style: .default)
        alert.addAction(okAction)
        alert.addAction(cancleAction)
        present(alert, animated: true)
    }
    
    
}

