//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    private var juiceMaker: JuiceMaker = JuiceMaker()
    
    @IBOutlet var modifiedFruitStockButton: UIBarButtonItem!
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawbananaJuiceButton: UIButton!
    @IBOutlet weak var mangkiJuiceButton: UIButton!
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showFruitStockLabel()
    }
    
    @IBAction func orderStrawbananaJuiceButtonClicked(_ sender: Any) {
        let result = showJuiceHandleResult(juiceMenu: .strawberryBanana)
        
        if result == "\(JuiceMenu.strawberryBanana.rawValue)를 1잔 만들었습니다." {
            orderJuiceSucceedAlert(juiceName: JuiceMenu.strawberryBanana.rawValue)
            showFruitStockLabel()
        } else{
            orderJuiceFailedAlert()
        }
    }
    
    @IBAction func orderMangkiJuiceButtonClicked(_ sender: Any) {
        showJuiceHandleResult(juiceMenu: .mangokiwi)
    }
    
    @IBAction func orderStrawberryJuiceButtonClicked(_ sender: Any) {
        showJuiceHandleResult(juiceMenu: .strawberry)
    }
    
    @IBAction func orderBananaJuiceButtonClicked(_ sender: Any) {
        showJuiceHandleResult(juiceMenu: .banana)
    }
    
    @IBAction func orderPineappleJuiceButtonClicked(_ sender: Any) {
        showJuiceHandleResult(juiceMenu: .pineapple)
    }
    
    @IBAction func orderKiwiJuiceButtonClicked(_ sender: Any) {
        showJuiceHandleResult(juiceMenu: .kiwi)
    }
    
    @IBAction func orderMangoButtonClicked(_ sender: Any) {
        showJuiceHandleResult(juiceMenu: .mango)
    }
    
    @IBAction func modifiedFruitStockButtonClicked(_ sender: UIBarButtonItem) {
        guard let FruitStockViewController = self.storyboard?.instantiateViewController(withIdentifier: "FruitStockViewController") else {
            return
        }
        self.navigationController?.pushViewController(FruitStockViewController, animated: true)
    }
    
    func showJuiceHandleResult(juiceMenu: JuiceMenu) -> String {
        let juiceResult = juiceMaker.makeJuice(juiceMenu: juiceMenu, amount: 1)
        switch juiceResult {
        case .success(let message):
            return message
        case .failure(.outOfStock):
            return "재고가 없습니다"
        }
    }
    
    func orderJuiceSucceedAlert(juiceName: String) {
        let alert = UIAlertController(title: "쥬스메이커", message: "\(juiceName)를 1잔 만들었습니다.", preferredStyle: UIAlertController.Style.actionSheet)
        
        let confirmAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(confirmAction)
        present(alert, animated: false, completion: nil)
    }
    
    func orderJuiceFailedAlert() {
        let alert = UIAlertController(title: "쥬스메이커", message: "재료가 모자랍니다. 재고를 수정할까요?", preferredStyle: UIAlertController.Style.actionSheet)
        
        let confirmYesAction = UIAlertAction(title: "예", style: UIAlertAction.Style.default, handler: nil)
        let confirmNoAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(confirmYesAction)
        alert.addAction(confirmNoAction)
        present(alert, animated: false, completion: nil)
    }
    
    func showFruitStockLabel() {
        strawberryLabel.text = juiceMaker.viewFruitStock(fruitName: .strawberry)
        bananaLabel.text = juiceMaker.viewFruitStock(fruitName: .banana)
        pineappleLabel.text = juiceMaker.viewFruitStock(fruitName: .pineapple)
        kiwiLabel.text = juiceMaker.viewFruitStock(fruitName: .kiwi)
        mangoLabel.text = juiceMaker.viewFruitStock(fruitName: .mango)
    }
}

