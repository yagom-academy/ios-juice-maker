
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

class MakeJuiceViewController: UIViewController {

    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    let myJuiceMaker = JuiceMaker()
    private let fixStockSegueIdentifier = "fixStockSegue"
    
    @IBAction func StrawberryBananaJuiceButtonDidTap(_ sender: UIButton) {
        checkStockAndAlert(juiceName: .strawberryBanana)
        strawberryLabel.text = String(myJuiceMaker.fruitStore.strawberry.stock)
        bananaLabel.text = String(myJuiceMaker.fruitStore.banana.stock)
    }
    
    @IBAction func MangoKiwiJuiceButtonDidTap(_ sender: UIButton) {
        checkStockAndAlert(juiceName: .mangoKiwi)
        kiwiLabel.text = String(myJuiceMaker.fruitStore.kiwi.stock)
        mangoLabel.text = String(myJuiceMaker.fruitStore.mango.stock)
    }
    
    @IBAction func StrawberryJuiceButtonDidTap(_ sender: UIButton) {
        checkStockAndAlert(juiceName: .strawberry)
        strawberryLabel.text = String(myJuiceMaker.fruitStore.strawberry.stock)
    }
    
    @IBAction func BananaJuiceButtonDidTap(_ sender: UIButton) {
        checkStockAndAlert(juiceName: .banana)
        bananaLabel.text = String(myJuiceMaker.fruitStore.banana.stock)
    }
    
    @IBAction func PineappleJuiceButtonDidTap(_ sender: UIButton) {
        checkStockAndAlert(juiceName: .pineapple)
        pineappleLabel.text = String(myJuiceMaker.fruitStore.pineapple.stock)
    }
    
    @IBAction func KiwiJuiceButtonDidTap(_ sender: UIButton) {
        checkStockAndAlert(juiceName: .kiwi)
        kiwiLabel.text = String(myJuiceMaker.fruitStore.kiwi.stock)
    }
    
    @IBAction func MangoJuiceButtonDidTap(_ sender: UIButton) {
        checkStockAndAlert(juiceName: .mango)
        mangoLabel.text = String(myJuiceMaker.fruitStore.mango.stock)
    }
    
    func checkStockAndAlert(juiceName: JuiceName) {
        do {
            try myJuiceMaker.makeJuice(juiceName: juiceName)
        } catch JuiceMakerError.insufficientFruit {
            showAlert(message: .insufficientFruit)
        } catch {
            showAlert(message: .unexpectedError)
        }
        showCompleteMessage(juiceName: juiceName)
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
}

extension MakeJuiceViewController: FixStockViewControllerDelegate {
    func fixStockViewController() {
        strawberryLabel.text = String(myJuiceMaker.fruitStore.strawberry.stock)
        bananaLabel.text = String(myJuiceMaker.fruitStore.banana.stock)
        pineappleLabel.text = String(myJuiceMaker.fruitStore.pineapple.stock)
        kiwiLabel.text = String(myJuiceMaker.fruitStore.kiwi.stock)
        mangoLabel.text = String(myJuiceMaker.fruitStore.mango.stock)
    }
}

