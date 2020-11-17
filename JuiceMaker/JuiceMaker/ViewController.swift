//GREEN

import UIKit

class ViewController: UIViewController {
    
    var juiceMaker: JuiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberry: UILabel!
    @IBOutlet weak var banana: UILabel!
    @IBOutlet weak var pineapple: UILabel!
    @IBOutlet weak var kiwi: UILabel!
    @IBOutlet weak var mango: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func strawberryBananaOrder(_ sender: UIButton) {
        let juice: String = "딸바쥬스"
        if (juiceMaker.strawberryStock >= 10) && (juiceMaker.bananaStock >= 1) {
            showOrderMessage(juice)
            juiceMaker.makeJuice(Juice.strawberryBananaJuice)
            showFruitStock(juiceMaker.strawberryStock, juiceMaker.bananaStock)
        }
        else {
            showAlertMessage()
        }
    }
    
    @IBAction func mangoKiwiOrder(_ sender: UIButton) {
        let juice: String = "망키쥬스"
        if (juiceMaker.mangoStock >= 2) && (juiceMaker.kiwiStock >= 1) {
            showOrderMessage(juice)
            juiceMaker.makeJuice(Juice.mangoKiwiJuice)
            showFruitStock(juiceMaker.mangoStock, juiceMaker.kiwiStock)
        }
        else {
            showAlertMessage()
        }
    }
    
    @IBAction func strawberryOrder(_ sender: UIButton) {
        let juice: String = "딸기쥬스"
        if juiceMaker.strawberryStock >= 3 {
            showOrderMessage(juice)
            juiceMaker.makeJuice(Juice.strawberryJuice)
            showFruitStock(juiceMaker.strawberryStock)
        }
        else {
            showAlertMessage()
        }
    }
    
    @IBAction func bananaOrder(_ sender: UIButton) {
        let juice: String = "바나나쥬스"
        if juiceMaker.bananaStock >= 3 {
            showOrderMessage(juice)
            juiceMaker.makeJuice(Juice.bananaJuice)
            showFruitStock(juiceMaker.bananaStock)
        }
        else {
            showAlertMessage()
        }
    }
    
    @IBAction func pineappleOrder(_ sender: UIButton) {
        let juice: String = "파인애플쥬스"
        if juiceMaker.pineappleStock >= 3 {
            showOrderMessage(juice)
            juiceMaker.makeJuice(Juice.pineappleJuice)
            showFruitStock(juiceMaker.pineappleStock)
        }
        else {
            showAlertMessage()
        }
    }
    
    
    @IBAction func kiwiOrder(_ sender: UIButton) {
        let juice: String = "키위쥬스"
        if juiceMaker.kiwiStock >= 3 {
            showOrderMessage(juice)
            juiceMaker.makeJuice(Juice.kiwiJuice)
            showFruitStock(juiceMaker.kiwiStock)
        }
        else {
            showAlertMessage()
        }
    }
    
    @IBAction func mangoOrder(_ sender: UIButton) {
        let juice: String = "망고쥬스"
        if juiceMaker.mangoStock >= 3 {
            showOrderMessage(juice)
            juiceMaker.makeJuice(Juice.mangoJuice)
            showFruitStock(juiceMaker.mangoStock)
        }
        else {
            showAlertMessage()
        }
    }
    
    func showOrderMessage(_ juice: String) {
        let alert = UIAlertController(title: nil, message: juice + " 나왔습니다! 맛있게 드세요!", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler : nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showAlertMessage() {
        let alert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: UIAlertController.Style.alert)
        
        guard let secondView = self.storyboard?.instantiateViewController(withIdentifier: "secondView") else {return}
        
        let cancel = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "예", style: .default, handler: { (action) in self.present(secondView, animated: true)})
        
        alert.addAction(cancel)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showFruitStock(_ fruit: Int...) {
        strawberry.text = String(juiceMaker.strawberryStock)
        banana.text = String(juiceMaker.bananaStock)
        pineapple.text = String(juiceMaker.pineappleStock)
        kiwi.text = String(juiceMaker.kiwiStock)
        mango.text = String(juiceMaker.mangoStock)
    }
}

