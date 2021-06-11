
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!

    let myJuiceMaker = JuiceMaker()

    @IBAction func strawberryBananaButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.makeStrawberryBananaJuice()
        } catch JuiceMaker.JuiceMakerError.insufficientFruit {
            showAlert(message: "재고가 모자라요. 재고를 수정할까요?")
        } catch {
        }
        strawberryLabel.text = String(myJuiceMaker.fruitStore.strawberry.stock)
        bananaLabel.text = String(myJuiceMaker.fruitStore.banana.stock)
        showCompleteMessage(juiceType: "딸바")
    }
    
    @IBAction func mangoKiwiButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.makeMangoKiwiJuice()
        } catch JuiceMaker.JuiceMakerError.insufficientFruit {
            showAlert(message: "재고가 모자라요. 재고를 수정할까요?")
        } catch {
        }
        kiwiLabel.text = String(myJuiceMaker.fruitStore.kiwi.stock)
        mangoLabel.text = String(myJuiceMaker.fruitStore.mango.stock)
        showCompleteMessage(juiceType: "망키")
    }
    
    @IBAction func strawberryButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.makeStrawberryJuice()
        } catch JuiceMaker.JuiceMakerError.insufficientFruit {
            showAlert(message: "재고가 모자라요. 재고를 수정할까요?")
        } catch {
        }
        strawberryLabel.text = String(myJuiceMaker.fruitStore.strawberry.stock)
        showCompleteMessage(juiceType: "딸기")
    }
    
    @IBAction func bananaButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.makeBananaJuice()
        } catch JuiceMaker.JuiceMakerError.insufficientFruit {
            showAlert(message: "재고가 모자라요. 재고를 수정할까요?")
        } catch {
        }
        bananaLabel.text = String(myJuiceMaker.fruitStore.banana.stock)
        showCompleteMessage(juiceType: "바나나")
    }
    
    @IBAction func pineappleButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.makePineappleJuice()
        } catch JuiceMaker.JuiceMakerError.insufficientFruit {
            showAlert(message: "재고가 모자라요. 재고를 수정할까요?")
        } catch {
        }
        pineappleLabel.text = String(myJuiceMaker.fruitStore.pineapple.stock)
        showCompleteMessage(juiceType: "파인애플")
    }
    
    @IBAction func kiwiButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.makeKiwiJuice()
        } catch JuiceMaker.JuiceMakerError.insufficientFruit {
            showAlert(message: "재고가 모자라요. 재고를 수정할까요?")
        } catch {
        }
        kiwiLabel.text = String(myJuiceMaker.fruitStore.kiwi.stock)
        showCompleteMessage(juiceType: "키위")
    }
    
    @IBAction func mangoButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.makeMangoJuice()
        } catch JuiceMaker.JuiceMakerError.insufficientFruit {
            showAlert(message: "재고가 모자라요. 재고를 수정할까요?")
        } catch {
        }
        mangoLabel.text = String(myJuiceMaker.fruitStore.mango.stock)
        showCompleteMessage(juiceType: "망고")
    }
    
    func showCompleteMessage(juiceType: String){
        let alert = UIAlertController(title: nil, message: "\(juiceType)쥬스 나왔습니다!맛있게 드세요!", preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "닫기", style: .default)
        alert.addAction(closeAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(message: String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .default){(action) in
            let fixStockVc = self.storyboard?.instantiateViewController(identifier: "fixStockNavigationController")
            fixStockVc?.modalTransitionStyle = .coverVertical
            self.present(fixStockVc!, animated: true, completion: nil)
        }
        let noAction = UIAlertAction(title: "아니오", style: .default)
        
        alert.addAction(okAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fixStockSegue",
           let navigationController = segue.destination as? UINavigationController
        {
            let nextVC = navigationController.visibleViewController as? FixStockViewController
            
            nextVC?.fruitStore = myJuiceMaker.fruitStore
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strawberryLabel.text = String(myJuiceMaker.fruitStore.strawberry.stock)
        bananaLabel.text = String(myJuiceMaker.fruitStore.banana.stock)
        pineappleLabel.text = String(myJuiceMaker.fruitStore.pineapple.stock)
        kiwiLabel.text = String(myJuiceMaker.fruitStore.kiwi.stock)
        mangoLabel.text = String(myJuiceMaker.fruitStore.mango.stock)
    }
}
