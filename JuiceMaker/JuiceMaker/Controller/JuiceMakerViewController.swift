//  Created by som, LJ.
//  Copyright © yagom academy. All rights reserved.

import UIKit

class JuiceMakerViewController: UIViewController {
    
    @IBOutlet private weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet private weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet private weak var strawberryJuiceButton: UIButton!
    @IBOutlet private weak var bananaJuiceButton: UIButton!
    @IBOutlet private weak var pineappleJuiceButton: UIButton!
    @IBOutlet private weak var kiwiJuiceButton: UIButton!
    @IBOutlet private weak var mangoJuiceButton: UIButton!
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designateFruitStock()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(displayFruitStock(_:)),
                                               name: NSNotification.Name("stockChanged"),
                                               object: nil)
    }
    
    func designateFruitStock() {
        let fruitStock = juiceMaker.fruitStorage.updateFruitStock()
        guard let strawberry = fruitStock[.strawberry],
              let banana = fruitStock[.banana],
              let pineapple = fruitStock[.pineapple],
              let kiwi = fruitStock[.kiwi],
              let mango = fruitStock[.mango] else {
            return
        }
        
        self.strawberryStockLabel.text = "\(strawberry)"
        self.bananaStockLabel.text = "\(banana)"
        self.pineappleStockLabel.text = "\(pineapple)"
        self.kiwiStockLabel.text = "\(kiwi)"
        self.mangoStockLabel.text = "\(mango)"
    }
    
    @objc func displayFruitStock(_ notification: Notification) {
        guard let stock = notification.userInfo?["stockChanged"] as? Dictionary<Fruit, Int> else {
            return
        }
        
        self.strawberryStockLabel.text = "\(stock[.strawberry] ?? 0)"
        self.bananaStockLabel.text = "\(stock[.banana] ?? 0)"
        self.pineappleStockLabel.text = "\(stock[.pineapple] ?? 0)"
        self.kiwiStockLabel.text = "\(stock[.kiwi] ?? 0)"
        self.mangoStockLabel.text = "\(stock[.mango] ?? 0)"
    }
    
    func showSuccessAlert(to juice: Juice) {
        let successAlert = UIAlertController(title: "\(juice.name) 나왔습니다!",
                                             message: "",
                                             preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "확인",
                                             style: .default,
                                             handler: nil))
        
        let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
        imageView.image = UIImage(named: "위대한 개츠비")
        successAlert.view.addSubview(imageView)
        let height = NSLayoutConstraint(item: successAlert.view,
                                        attribute: .height,
                                        relatedBy: .equal,
                                        toItem: nil,
                                        attribute: .notAnAttribute,
                                        multiplier: 1,
                                        constant: 320)
        let width = NSLayoutConstraint(item: successAlert.view,
                                       attribute: .width,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                       constant: 250)
        successAlert.view.addConstraint(height)
        successAlert.view.addConstraint(width)
        
        self.present(successAlert, animated: false)
    }
    
    func showFailedAlert() {
        let failedAlert = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?",
                                            message: "",
                                            preferredStyle: .alert)
        failedAlert.addAction(UIAlertAction(title: "예",
                                            style: .default,
                                            handler: {_ in
            self.performSegue(withIdentifier: "fruitStockUp", sender: nil)
        }))
        failedAlert.addAction(UIAlertAction(title: "아니오",
                                            style: .cancel,
                                            handler: nil))
        self.present(failedAlert, animated: false)
    }
    
    func showEmptyStockAlert() {
        let emptyStockAlert = UIAlertController(title: "재고가 비어있습니다.",
                                                message: "",
                                                preferredStyle: .alert)
        emptyStockAlert.addAction(UIAlertAction(title: "확인",
                                                style: .default,
                                                handler: nil))
        self.present(emptyStockAlert, animated: false)
    }
    
    func showUnknownErrorAlert() {
        let emptyStockAlert = UIAlertController(title: "알 수 없는 오류입니다.",
                                                message: "",
                                                preferredStyle: .alert)
        emptyStockAlert.addAction(UIAlertAction(title: "확인",
                                                style: .default,
                                                handler: nil))
        self.present(emptyStockAlert, animated: false)
    }
    
    @IBAction func tappedOrderButton(_ sender: UIButton) {
        guard let juice = Juice(rawValue: sender.tag) else {
            return
        }
        juiceMaker.makeJuice(to: juice, in: self)
    }
}

