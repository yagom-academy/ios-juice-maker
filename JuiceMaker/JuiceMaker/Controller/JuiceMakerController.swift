//
//  JuiceMaker - ViewController.swift
//  Created by 원툴, 두두. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryBananaButton: UIButton!
    @IBOutlet weak var strawberryButton: UIButton!
    @IBOutlet weak var bananaButton: UIButton!
    @IBOutlet weak var pineappleButton: UIButton!
    @IBOutlet weak var mangoKiwiButton: UIButton!
    @IBOutlet weak var kiwiButton: UIButton!
    @IBOutlet weak var mangoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitLabel()
    }
    
    private func updateFruitLabel() {
        let stock = juiceMaker.fruitStock
        
        let fruitLabelDictionary: [Fruit: UILabel] = [
            .strawberry: strawberryStockLabel,
            .banana: bananaStockLabel,
            .pineapple: pineappleStockLabel,
            .kiwi: kiwiStockLabel,
            .mango: mangoStockLabel
        ]
        
        for (fruit, amount) in stock {
            let label = fruitLabelDictionary[fruit]
            label?.text = "\(amount)"
        }
    }
    
    @IBAction func tapStockEditButton(_ sender: UIBarButtonItem) {
        moveToStockViewController()
    }
    
    private func moveToStockViewController() {
        let stock = self.juiceMaker.fruitStock
        
        guard let stockViewController = self.storyboard?.instantiateViewController(identifier: "StockViewController", creator: { coder in
            return StockViewController(coder: coder, stock: stock)
        }) else {
            return
        }
        
        let navigationController = UINavigationController(rootViewController: stockViewController)
        self.present(navigationController, animated: true)
    }
    
    @IBAction func order(_ sender: UIButton) {
        do{
            let juice = try check(button: sender)
            try juiceMaker.make(fruitJuice: juice)
            updateFruitLabel()
            showOkAlert(title: "\(juice) " + AlertMessage.makeJuice)
        } catch JuiceMakerError.invalidButton {
            showOkAlert(title: AlertMessage.pushWrongButton)
        } catch JuiceMakerError.outOfStock {
            showStockErrorAlert(title: AlertMessage.outOfStock)
        } catch {
            showOkAlert(title: AlertMessage.unknownError)
        }
    }
    
    private func check(button: UIButton) throws -> Juice {
        switch button {
        case strawberryBananaButton:
            return .strawberryBananaJuice
        case strawberryButton:
            return .strawberryJuice
        case bananaButton:
            return .bananaJuice
        case pineappleButton:
            return .pineappleJuice
        case mangoKiwiButton:
            return .mangoKiwiJuice
        case kiwiButton:
            return .kiwiJuice
        case mangoButton:
            return .mangoJuice
        default:
            throw JuiceMakerError.invalidButton
        }
    }
}

extension JuiceMakerController {
    func showStockErrorAlert(title: String){
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertMessage.yes, style: .default) { _ in
            self.moveToStockViewController()
        }
        
        let cancelAction = UIAlertAction(title: AlertMessage.no, style: .default)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    func showOkAlert(title: String){
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertMessage.ok, style: .default)
        
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}

enum AlertMessage{
    static let makeJuice = "나왔습니다! 맛있게 드세요!"
    static let pushWrongButton = "버튼을 잘못 누르셨습니다."
    static let unknownError = "알 수 없는 오류"
    static let outOfStock = "재료가 모자라요. 재고를 수정할까요?"
    static let yes = "예"
    static let no = "아니오"
    static let ok = "확인"
}
