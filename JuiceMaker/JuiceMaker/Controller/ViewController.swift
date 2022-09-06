//
//  JuiceMaker - ViewController.swift
//  Created by Wonbi, woong
//

import UIKit

extension NSNotification.Name {
    static let changedStockCount = NSNotification.Name("changedStockCount")
    static let madeJuiceAlert = NSNotification.Name("madeJuiceAlert")
    static let failedAlert = NSNotification.Name("failedAlert")
}

class ViewController: UIViewController {
    let store = FruitStore(stockCount: 10)
    
    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(displayStock(_:)),
                                               name: .changedStockCount,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(madeJuiceAlert(message:)),
                                               name: .madeJuiceAlert,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(failedAlert(_:)),
                                               name: .failedAlert,
                                               object: nil)
        
        
        NotificationCenter.default.post(name: .changedStockCount,
                                        object: nil,
                                        userInfo: nil)
    }
    
    @IBAction func tappedButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        
        viewController.stock = store.displayStockCount()
        
        present(viewController, animated: true)
    }
    
    @IBAction func tappedOrderButton(_ sender: UIButton) {
        guard let juiceName = sender.restorationIdentifier else { return }
        guard let juice = Juice(rawValue: juiceName) else { return }
        
        let juiceMaker = JuiceMaker(store: store)
        
        juiceMaker.makeJuice(juice)
    }
    
    @objc func madeJuiceAlert(message: Notification) {
        guard let juiceName = message.userInfo?["JuiceName"] else { return }
        let alert = UIAlertController(title: nil, message: "\(juiceName) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
        
    }
    
    @objc func failedAlert(_ noti: Notification) {
        let alert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default, handler: { [self] ACTION in
            tappedButton(UIButton())
        })
        let noAction = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true)
    }
    
    @objc func displayStock(_ noti: Notification) {
        strawberryCountLabel.text = String(store.displayStockCount()[0])
        bananaCountLabel.text = String(store.displayStockCount()[1])
        pineappleCountLabel.text = String(store.displayStockCount()[2])
        kiwiCountLabel.text = String(store.displayStockCount()[3])
        mangoCountLabel.text = String(store.displayStockCount()[4])
    }
}



// 주스 제조후에 나오는 얼럿 : 000 쥬스 나왔습니다! 맛있게 드세요! (확인)
// 주스 재고가 없는 경우 얼럿 : 재료가 모자라요 재고를 수정할까요? (예-재고수정화면이동/아니오-얼럿닫기)
