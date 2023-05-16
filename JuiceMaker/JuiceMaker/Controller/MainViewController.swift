//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    let juiceMaker = JuiceMaker(fruitStore: FruitStore())
    
    @IBOutlet weak var MangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
    }
    
    private func configureLabel() {
        self.MangoStockLabel.text = String(juiceMaker.fruitStore.fruitStock[.mango]!)
    }
    
    @IBAction func onTouchStockButton(_ sender: UIBarButtonItem) {
        guard let vcStock = self.storyboard?.instantiateViewController(identifier: "StockViewController") as? UINavigationController else {
            return
        }
        self.navigationController?.present(vcStock, animated: true)
    }

    @IBAction func onTouchMangoButton(_ sender: UIButton) {
        switch self.juiceMaker.makeJuice(juice: .mangoJuice) {
        case .success(let juice):
            let alert = UIAlertController(title: "주문", message: "\(juice.name) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            
        case .failure(_):
            let alert = UIAlertController(title: "재고 부족", message: "재료가 모잘라요. 재고를 수정할까요?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
