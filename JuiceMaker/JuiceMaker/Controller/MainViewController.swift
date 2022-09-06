//
//  Created by Baem, Jeremy
//
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var strawBerryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineAppleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawBerryBananaButton: UIButton!
    @IBOutlet weak var mangoKiwiButton: UIButton!
    @IBOutlet weak var strawBerryButton: UIButton!
    @IBOutlet weak var bananaButton: UIButton!
    @IBOutlet weak var pineAppleButton: UIButton!
    @IBOutlet weak var kiwiButton: UIButton!
    @IBOutlet weak var mangoButton: UIButton!
    
    let juiceMaker = JuiceMaker()
    let fruitStock = FruitStore().stock
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func orderJuice(_ sender: UIButton) {
        switch sender {
        case strawBerryBananaButton:
            juiceMaker.makeJuice(.strawBerryBanana)
            present(alertOrderIsReady(.strawBerryBanana),animated: true, completion: nil)
        case mangoKiwiButton:
            juiceMaker.makeJuice(.mangoKiwi)
            present(alertOrderIsReady(.mangoKiwi),animated: true, completion: nil)
        case strawBerryButton:
            juiceMaker.makeJuice(.strawBerry)
            present(alertOrderIsReady(.strawBerry),animated: true, completion: nil)
        case bananaButton:
            juiceMaker.makeJuice(.banana)
            present(alertOrderIsReady(.banana),animated: true, completion: nil)
        case pineAppleButton:
            juiceMaker.makeJuice(.pineApple)
            present(alertOrderIsReady(.pineApple),animated: true, completion: nil)
        case kiwiButton:
            juiceMaker.makeJuice(.kiwi)
            present(alertOrderIsReady(.kiwi),animated: true, completion: nil)
        case mangoButton:
            juiceMaker.makeJuice(.mango)
            present(alertOrderIsReady(.mango),animated: true, completion: nil)
        default:
            print("x")
        }
    }
    
    func alertOrderIsReady(_ juice: Juice) -> UIAlertController {
        let alert = UIAlertController(title: "alert", message: "\(juice.rawValue) 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")})
        let cancle = UIAlertAction(title: "Cancle", style: .default, handler: { _ in
            NSLog("The \"Cancle\" alert occured.")})
        alert.addAction(ok)
        alert.addAction(cancle)
        
        return alert
    }

}

