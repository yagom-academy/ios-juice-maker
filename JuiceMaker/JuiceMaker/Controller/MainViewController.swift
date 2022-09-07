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
        setLabelDefaultValue()
        
        
    }
    
    func setLabelDefaultValue() {
        strawBerryLabel.text = fruitStock[.strawBerry]?.description
        bananaLabel.text = fruitStock[.banana]?.description
        pineAppleLabel.text = fruitStock[.pineApple]?.description
        kiwiLabel.text = fruitStock[.kiwi]?.description
        mangoLabel.text = fruitStock[.mango]?.description
    }
    

    @IBAction func orderJuice(_ sender: UIButton) {
        if let sender = sender.restorationIdentifier,
            let juice = Juice(rawValue: sender) {
            if juiceMaker.requestStockAvailability(for: juice) {
                juiceMaker.store.useStockForRecipe(of: juice)
                present(alertOrderIsReady(juice), animated: true, completion: nil)
            } else {
                present(alertOrderIsNotReady(), animated: true, completion: nil)
            }
        }
    }
    
    func alertOrderIsReady(_ juice: Juice) -> UIAlertController {
        let alert = UIAlertController(title: "완성!", message: "\(juice.rawValue) 나왔습니다! 맛있게 드세요!", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")})
        alert.addAction(ok)
        
        return alert
    }
    
    func alertOrderIsNotReady() -> UIAlertController {
        let alert = UIAlertController(title: "재고 부족!", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")})
        let cancle = UIAlertAction(title: "Cancle", style: .default, handler: { _ in
            NSLog("The \"Cancle\" alert occured.")})
        alert.addAction(ok)
        alert.addAction(cancle)
        
        return alert
    }
}

