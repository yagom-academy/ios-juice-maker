//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var juiceMaker = JuiceMaker()
    private var menuMap = [UIButton : JuiceMenu]()
    private var fruitSymbol = ["🍓", "🍌", "🍍", "🥝", "🥭"]
    
    private var strawberryCount : Int = 0 {
        didSet {
            strawberryCountLabel.text = "\(strawberryCount)"
        }
    }
    private var bananaCount : Int = 0 {
        didSet {
            bananaCountLabel.text = "\(bananaCount)"
        }
    }
    private var pineappleCount : Int = 0 {
        didSet {
            pineappleCountLabel.text = "\(pineappleCount)"
        }
    }
    private var kiwiCount : Int = 0 {
        didSet {
            kiwiCountLabel.text = "\(kiwiCount)"
        }
    }
    private var mangoCount : Int = 0 {
        didSet {
            mangoCountLabel.text = "\(mangoCount)"
        }
    }
    @IBOutlet var fruitImageLabels: [UILabel]!
    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    @IBOutlet weak var ddalbaOrderButton: UIButton!
    @IBOutlet weak var mankiOrderButton: UIButton!
    @IBOutlet weak var strawberryOrderButton: UIButton!
    @IBOutlet weak var bananaOrderButton: UIButton!
    @IBOutlet weak var pineappleOrderButton: UIButton!
    @IBOutlet weak var kiwiOrderButton: UIButton!
    @IBOutlet weak var mangoOrderButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeFruitImage()
        initializeStockLabel()
        initializeMenuOrder()
    }
    
    @IBAction func orderJuiceMenu(_ orderButton: UIButton) {
        guard let orderedMenu = menuMap[orderButton] else {
            print("Error: 버튼과 연결된 메뉴가 없습니다.")
            return
        }
        
        guard juiceMaker.isAvailableMaking(juice: orderedMenu) else {
            let alertMessage = juiceMaker.makeFailMessage()
            showFailedAlert(by: alertMessage)
            return
        }
        
        juiceMaker.makeJuice(of: orderedMenu)
        
        let alertMessage = juiceMaker.makeSuccessMessage(of: orderedMenu)
        showSuccessAlert(by: alertMessage)
        
        updateStockStatusAfterMaking(order: orderedMenu)

        return
    }
}
extension ViewController {
    private func initializeFruitImage() {
        for fruitIdx in 0..<fruitImageLabels.count {
            fruitImageLabels[fruitIdx].text = fruitSymbol[fruitIdx]
        }
    }
    private func initializeStockLabel() {
        strawberryCount = juiceMaker.checkStockAmount(of: juiceMaker.strawberry)
        bananaCount = juiceMaker.checkStockAmount(of: juiceMaker.banana)
        pineappleCount = juiceMaker.checkStockAmount(of: juiceMaker.pineapple)
        kiwiCount = juiceMaker.checkStockAmount(of: juiceMaker.kiwi)
        mangoCount = juiceMaker.checkStockAmount(of: juiceMaker.mango)
    }
    
    private func initializeMenuOrder() {
        menuMap[ddalbaOrderButton] = .ddalbaJuice
        menuMap[mankiOrderButton] = .mangoKiwiJuice
        menuMap[strawberryOrderButton] = .strawberryJuice
        menuMap[bananaOrderButton] = .bananaJuice
        menuMap[pineappleOrderButton] = .pineappleJuice
        menuMap[kiwiOrderButton] = .kiwiJuice
        menuMap[mangoOrderButton] = .mangoJuice
    }

    private func updateStockStatusAfterMaking(order: JuiceMenu) {
        switch order {
        case .ddalbaJuice:
            strawberryCount = juiceMaker.checkStockAmount(of: juiceMaker.strawberry)
            bananaCount = juiceMaker.checkStockAmount(of: juiceMaker.banana)
        case .mangoKiwiJuice:
            mangoCount = juiceMaker.checkStockAmount(of: juiceMaker.mango)
            kiwiCount = juiceMaker.checkStockAmount(of: juiceMaker.kiwi)
        case .strawberryJuice:
            strawberryCount = juiceMaker.checkStockAmount(of: juiceMaker.strawberry)
        case .bananaJuice:
            bananaCount = juiceMaker.checkStockAmount(of: juiceMaker.banana)
        case .pineappleJuice:
            pineappleCount = juiceMaker.checkStockAmount(of: juiceMaker.pineapple)
        case .mangoJuice:
            mangoCount = juiceMaker.checkStockAmount(of: juiceMaker.mango)
        case .kiwiJuice:
            kiwiCount = juiceMaker.checkStockAmount(of: juiceMaker.kiwi)
        }
    }
    
    private func showSuccessAlert(by message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(okAction)

        present(alert, animated: true, completion: nil)
    }
    
    private func showFailedAlert(by message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "아니오", style: .default, handler: nil)
        let okAction = UIAlertAction(title: "네", style: .default) { action in
            self.presentModifyingStockView()
        }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    private func presentModifyingStockView() {
        guard let modifyingStockViewController =
                self.storyboard?.instantiateViewController(withIdentifier: "modifyStockVC") else {
            return
        }
        
        self.present(modifyingStockViewController, animated: true, completion: nil)
    }
}

