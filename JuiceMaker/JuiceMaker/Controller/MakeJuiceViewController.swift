
import UIKit

enum JuiceName: CustomStringConvertible{
    case strawberryBanana
    case mangoKiwi
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    
    var description: String {
        switch self {
        case .strawberryBanana:
            return "딸바"
        case .mangoKiwi:
            return "망키"
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .pineapple:
            return "파인애플"
        case .kiwi:
            return "키위"
        case .mango:
            return "망고"
        }
    }
}

class MakeJuiceViewController: UIViewController, sendBackDelegate {

    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    let myJuiceMaker = JuiceMaker()

    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
        do {
            try myJuiceMaker.makeJuice(juiceName: .strawberryBanana)
        } catch JuiceMakerError.insufficientFruit {
            showAlert(message: .insufficientFruit)
        } catch {
            showAlert(message: .unexpectedError)
        }
        strawberryLabel.text = String(myJuiceMaker.fruitStore.strawberry.stock)
        bananaLabel.text = String(myJuiceMaker.fruitStore.banana.stock)
        showCompleteMessage(juiceName: .strawberryBanana)
    }
    
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
        do {
            try myJuiceMaker.makeJuice(juiceName: .mangoKiwi)
        } catch JuiceMakerError.insufficientFruit {
            showAlert(message: .insufficientFruit)
        } catch {
            showAlert(message: .unexpectedError)
        }
        kiwiLabel.text = String(myJuiceMaker.fruitStore.kiwi.stock)
        mangoLabel.text = String(myJuiceMaker.fruitStore.mango.stock)
        showCompleteMessage(juiceName: .mangoKiwi)
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        do {
            try myJuiceMaker.makeJuice(juiceName: .strawberry)
        } catch JuiceMakerError.insufficientFruit {
            showAlert(message: .insufficientFruit)
        } catch {
            showAlert(message: .unexpectedError)
        }
        strawberryLabel.text = String(myJuiceMaker.fruitStore.strawberry.stock)
        showCompleteMessage(juiceName: .strawberry)
    }
    
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        do {
            try myJuiceMaker.makeJuice(juiceName: .banana)
        } catch JuiceMakerError.insufficientFruit {
            showAlert(message: .insufficientFruit)
        } catch {
            showAlert(message: .unexpectedError)
        }
        bananaLabel.text = String(myJuiceMaker.fruitStore.banana.stock)
        showCompleteMessage(juiceName: .banana)
    }
    
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
        do {
            try myJuiceMaker.makeJuice(juiceName: .pineapple)
        } catch JuiceMakerError.insufficientFruit {
            showAlert(message: .insufficientFruit)
        } catch {
            showAlert(message: .unexpectedError)
        }
        pineappleLabel.text = String(myJuiceMaker.fruitStore.pineapple.stock)
        showCompleteMessage(juiceName: .pineapple)
    }
    
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        do {
            try myJuiceMaker.makeJuice(juiceName: .kiwi)
        } catch JuiceMakerError.insufficientFruit {
            showAlert(message: .insufficientFruit)
        } catch {
            showAlert(message: .unexpectedError)
        }
        kiwiLabel.text = String(myJuiceMaker.fruitStore.kiwi.stock)
        showCompleteMessage(juiceName: .kiwi)
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        do {
            try myJuiceMaker.makeJuice(juiceName: .mango)
        } catch JuiceMakerError.insufficientFruit {
            showAlert(message: .insufficientFruit)
        } catch {
            showAlert(message: .unexpectedError)
        }
        mangoLabel.text = String(myJuiceMaker.fruitStore.mango.stock)
        showCompleteMessage(juiceName: .mango)
    }
    
    func showCompleteMessage(juiceName: JuiceName){
        let alert = UIAlertController(title: nil, message: "\(juiceName)쥬스 나왔습니다!맛있게 드세요!", preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "닫기", style: .default)
        alert.addAction(closeAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(message: JuiceMakerError){
        let alert = UIAlertController(title: nil, message: message.description, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .default){(action) in
            self.performSegue(withIdentifier: "fixStockSegue", sender: self)
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
            let fixStockVC = navigationController.visibleViewController as? FixStockViewController
            fixStockVC?.fruitStore = myJuiceMaker.fruitStore
            fixStockVC?.delegate = self
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
    
    func dataRecieved(data: String) {
        strawberryLabel.text = data
    }

}
