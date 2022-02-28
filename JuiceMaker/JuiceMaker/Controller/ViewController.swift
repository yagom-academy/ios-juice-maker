//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var strawberryCount: UILabel!
    @IBOutlet weak var bananaCount: UILabel!
    @IBOutlet weak var pineappleCount: UILabel!
    @IBOutlet weak var kiwiCount: UILabel!
    @IBOutlet weak var mangoCount: UILabel!
    var fruitStore = FruitStore()
    
    // MARK: 재고수정 버튼 눌렀을 시 화면 전환
    @IBAction func navpush(_ sender: Any) {
        guard let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else { return }
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    @IBAction func orderStrawBerryJuice(_ sender: Any) {
        let orderJuice = JuiceMaker()
        print(fruitStore.fruits)
        orderJuice.makeJuice(fruitJuice: .strawberryBanana)
        showConfirmAlert()
    }
    // MARK: 재고 없을 시 얼럿 메시지
    func showAlertMessage() {
        let juiceOutOfStockAlert = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: "", preferredStyle: .alert)
        let yesButton = UIAlertAction(title: "YES", style: .default) {_ in
            guard let pushViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else { return }
            self.navigationController?.pushViewController(pushViewController, animated: true)
    }
        let noButton = UIAlertAction(title: "NO", style: .destructive, handler: nil)
        juiceOutOfStockAlert.addAction(noButton)
        juiceOutOfStockAlert.addAction(yesButton)
        present(juiceOutOfStockAlert, animated: false, completion: nil)
    
    }
    // MARK: 재고 있을 시 얼럿 메시지
    func showConfirmAlert() {
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        let provideJuiceAlert = UIAlertController(title: "쥬스 나왔습니다! 맛있게 드세요!", message: "", preferredStyle: .alert)
        provideJuiceAlert.addAction(okButton)
        present(provideJuiceAlert, animated: false, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
