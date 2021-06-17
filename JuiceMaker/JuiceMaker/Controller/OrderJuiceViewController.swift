//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class OrderJuiceViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    @IBOutlet weak var touchBananaJuice: UIButton!
    @IBOutlet weak var touchStrawberryBananaJuice: UIButton!
    @IBOutlet weak var tocuhStrawberryJuice: UIButton!
    @IBOutlet weak var touchPineaplleJuice: UIButton!
    @IBOutlet weak var touchMangoKiwiJuice: UIButton!
    @IBOutlet weak var touchKiwiJuice: UIButton!
    @IBOutlet weak var touchMangoJuice: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showStockOfFruits()
        // Do any additional setup after loading the view.
    }
    
    private func showStockOfFruits() {
        strawberryStock.text = "\(juiceMaker.fruitStore.getStock(of: .strawberry))"
        bananaStock.text = "\(juiceMaker.fruitStore.getStock(of: .banana))"
        pineappleStock.text = "\(juiceMaker.fruitStore.getStock(of: .pineapple))"
        kiwiStock.text = "\(juiceMaker.fruitStore.getStock(of: .kiwi))"
        mangoStock.text = "\(juiceMaker.fruitStore.getStock(of: .mango))"
    }
    
    @IBAction func touchUpModifyStock(_ sender: UIBarButtonItem) {
        guard let moveIntoModifyStock = self.storyboard?.instantiateViewController(withIdentifier: "storage") else { return }
        self.navigationController?.pushViewController(moveIntoModifyStock, animated: true)
    }
    
    @IBAction func touchUpJuiceMenu(_ sender: UIButton) {
        var selectMenu: JuiceMenu?
    
        switch sender {
        case touchBananaJuice:
            selectMenu = .bananaJuice
        case touchStrawberryBananaJuice:
            selectMenu = .strawberryBananaJuice
        case tocuhStrawberryJuice:
            selectMenu = .strawberryJuice
        case touchPineaplleJuice:
            selectMenu = .pineappleJuice
        case touchMangoKiwiJuice:
            selectMenu = .mangoKiwiJuice
        case touchKiwiJuice:
            selectMenu = .kiwiJuice
        case touchMangoJuice:
            selectMenu = .mangoJuice
        default:
            print("알수없는 버튼입니다.")
        }
        guard let selectMenu = selectMenu else { return }
        do {
            try juiceMaker.makeJuice(of: selectMenu)
                showStockOfFruits()
                showResultOfOrder(juice: selectMenu , makeJuice: true, unknownErrorMessage: nil)
            } catch ErrorCase.outOfStock {
                showResultOfOrder(juice: selectMenu, makeJuice: false, unknownErrorMessage: nil)
            } catch {
                showResultOfOrder(juice: nil, makeJuice: false, unknownErrorMessage: "Unexpected error: \(error).")
            }
    }
    
    private func showResultOfOrder(juice: JuiceMenu?, makeJuice: Bool, unknownErrorMessage: String?) {
        if makeJuice == true {
            guard let juice = juice else { return }
            let sucessAlert = UIAlertController(title: "주문하신 \(juice.rawValue) 나왔습니다", message: nil, preferredStyle: UIAlertController.Style.alert)
            let defaultAction = UIAlertAction(title: "OK", style: .destructive, handler : nil)
            sucessAlert.addAction(defaultAction)
            present(sucessAlert, animated: true, completion: nil)
        } else if makeJuice == false && unknownErrorMessage == nil {
            let failAlert = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: nil, preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler : { action in
                guard let moveIntoModifyStock = self.storyboard?.instantiateViewController(withIdentifier: "storage") else { return }
                self.navigationController?.pushViewController(moveIntoModifyStock, animated: true)})
            let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler : nil)
            failAlert.addAction(cancel)
            failAlert.addAction(okAction)
            present(failAlert, animated: true, completion: nil)
        } else {
            guard let unknownErrorMessage = unknownErrorMessage else { return }
            let errorAlert = UIAlertController(title: "알수없는 오류가 발생했습니다.", message: unknownErrorMessage, preferredStyle: UIAlertController.Style.alert)
            let defaultAction = UIAlertAction(title: "OK", style: .destructive, handler : nil)
            errorAlert.addAction(defaultAction)
            present(errorAlert, animated: true, completion: nil)
        }
    }
}

