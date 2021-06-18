//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    enum KindOfAlert {
        case successOrder
        case outOfStock
    }
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    let juiceMaker = JuiceMaker.shared
    var juiceMakerAlert: UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockLabels()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination.children.first as? ChangeStockViewController else {
            return
        }
        vc.delegate = self
    }
    
    func updateStockLabels() {
        do {
            strawberryStockLabel.text = try juiceMaker.returnStockString(of: .strawberry)
            bananaStockLabel.text = try juiceMaker.returnStockString(of: .banana)
            pineappleStockLabel.text = try juiceMaker.returnStockString(of: .pineapple)
            kiwiStockLabel.text = try juiceMaker.returnStockString(of: .kiwi)
            mangoStockLabel.text = try juiceMaker.returnStockString(of: .mango)
        } catch {
            return
        }
    }
    
    func createAlert(kind: KindOfAlert) {
        if kind == .successOrder {
            juiceMakerAlert = createSuccessOrderAlert()
        } else if kind == .outOfStock {
            juiceMakerAlert = createOutOfStockErrorAlert()
        }
    }
    
    func showAlert(name: KindOfAlert, juiceName: String = "") {
        createAlert(kind: name)
        guard let alert = juiceMakerAlert, let title = alert.title else { return }
        alert.title = juiceName + title
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func touchUpOrderButton(_ sender: UIButton) {
        guard let juiceName = sender.titleLabel?.text?.components(separatedBy: " ").first,
              let juice = Juice(rawValue: juiceName) else {
            return
        }
        do {
            try juiceMaker.orderJuice(name: juice)
            updateStockLabels()
            showAlert(name: .successOrder, juiceName: juiceName)
        } catch FruitStoreError.outOfStock {
            showAlert(name: .outOfStock)
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension ViewController {
    func createSuccessOrderAlert() -> UIAlertController {
        let alert = UIAlertController(title: " 나왔습니다! 맛있게 드세요", message: nil, preferredStyle: .alert)
        let checkAction = UIAlertAction(title: "확인", style: .default, handler : nil )
        alert.addAction(checkAction)
        return alert
    }
    
    func createOutOfStockErrorAlert() -> UIAlertController {
        let alert = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: nil, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default, handler : { (action) in
            guard let controller = self.storyboard?.instantiateViewController(identifier: "controller") else { return }
            guard let view = controller.children.first as? ChangeStockViewController else { return }
            view.delegate = self
            self.present(controller, animated: true, completion: nil)
        })
        let noAction = UIAlertAction(title: "아니오", style: .cancel, handler : nil)
        alert.addAction(noAction)
        alert.addAction(yesAction)
        return alert
    }
}

extension ViewController: StockDelegate {
    func stockDidChange(_ vc: UIViewController) {
        updateStockLabels()
    }
}
