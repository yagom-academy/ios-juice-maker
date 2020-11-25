//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private var juiceMaker = JuiceMaker()
    private var menuMap = [UIButton : JuiceMenu]()
    private var fruitSymbol = ["🍓", "🍌", "🍍", "🥝", "🥭"]
    
    
    private var strawberryCount : Int = 0 {
        didSet {
            strawberryLabel.text = "\(strawberryCount)"
        }
    }
    private var bananaCount : Int = 0 {
        didSet {
            bananaLabel.text = "\(bananaCount)"
        }
    }
    private var pineappleCount : Int = 0 {
        didSet {
           pineappleLabel.text = "\(pineappleCount)"
        }
    }
    private var kiwiCount : Int = 0 {
        didSet {
          kiwiLabel.text = "\(kiwiCount)"
        }
    }
    private var mangoCount : Int = 0 {
        didSet {
           mangoLabel.text = "\(mangoCount)"
        }
    }
    
    @IBOutlet var fruitSymbolLabels: [UILabel]!
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var ddalbaOrderButton: UIButton!
    @IBOutlet weak var mankiOrderButton: UIButton!
    @IBOutlet weak var strawberryOrderButton: UIButton!
    @IBOutlet weak var bananaOrderButton: UIButton!
    @IBOutlet weak var pineappleOrderButton: UIButton!
    @IBOutlet weak var kiwiOrderButton: UIButton!
    @IBOutlet weak var mangoOrderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeFruitImages()
        initializeStockLabels()
        initializeMenuOrder()
    }
    
    @IBAction func tappedOrderButton(_ orderType: UIButton) {
        guard let orderedMenu = menuMap[orderType] else {
            print("Error: 버튼과 연결된 메뉴가 없습니다.")
            return
        }
        
        let menuRecipe = orderedMenu.recipe()
        
        guard juiceMaker.isAvailableMaking(juice: orderedMenu, checking: menuRecipe) else {
            let alertMessage = makeFailMessage()
            showFailedAlert(by: alertMessage)
            return
        }
        
        juiceMaker.makeJuice(of: orderedMenu, with: menuRecipe)
        
        let alertMessage = makeSuccessMessage(of: orderedMenu)
        showSuccessAlert(by: alertMessage)
        
        updateStockStatusAfterMaking(order: orderedMenu)
    }
}
extension ViewController {
    private func initializeFruitImages() {
        guard fruitSymbolLabels.count == fruitSymbol.count else {
            print("과일 이미지 갯수랑 화면의 이미지 레이블 갯수가 맞지 않습니다. ")
            return
        }
        for fruitIndex in 0..<fruitSymbolLabels.count {
            fruitSymbolLabels[fruitIndex].text = fruitSymbol[fruitIndex]
        }
    }
    
    private func initializeStockLabels() {
        guard let strawberryProductNumber = juiceMaker.fruitProductNumberContainer["strawberry"],
              let bananaProductNumber = juiceMaker.fruitProductNumberContainer["banana"],
              let pineappleProductNumber = juiceMaker.fruitProductNumberContainer["pineapple"],
              let kiwiProductNumber = juiceMaker.fruitProductNumberContainer["kiwi"],
              let mangoProductNumber = juiceMaker.fruitProductNumberContainer["mango"] else {
            return
        }

        strawberryCount = juiceMaker.checkStockAmount(of: juiceMaker.fruitsContainer[strawberryProductNumber])
        bananaCount = juiceMaker.checkStockAmount(of: juiceMaker.fruitsContainer[bananaProductNumber])
        pineappleCount = juiceMaker.checkStockAmount(of: juiceMaker.fruitsContainer[pineappleProductNumber])
        kiwiCount = juiceMaker.checkStockAmount(of: juiceMaker.fruitsContainer[kiwiProductNumber])
        mangoCount = juiceMaker.checkStockAmount(of: juiceMaker.fruitsContainer[mangoProductNumber])
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
        guard let strawberryProductNumber = juiceMaker.fruitProductNumberContainer["strawberry"],
              let bananaProductNumber = juiceMaker.fruitProductNumberContainer["banana"],
              let pineappleProductNumber = juiceMaker.fruitProductNumberContainer["pineapple"],
              let kiwiProductNumber = juiceMaker.fruitProductNumberContainer["kiwi"],
              let mangoProductNumber = juiceMaker.fruitProductNumberContainer["mango"] else {
            return
        }
        
        switch order {
        case .ddalbaJuice:
            strawberryCount = juiceMaker.checkStockAmount(of: juiceMaker.fruitsContainer[strawberryProductNumber])
            bananaCount = juiceMaker.checkStockAmount(of: juiceMaker.fruitsContainer[bananaProductNumber])
        case .mangoKiwiJuice:
            mangoCount = juiceMaker.checkStockAmount(of: juiceMaker.fruitsContainer[mangoProductNumber])
            kiwiCount = juiceMaker.checkStockAmount(of: juiceMaker.fruitsContainer[kiwiProductNumber])
        case .strawberryJuice:
            strawberryCount = juiceMaker.checkStockAmount(of: juiceMaker.fruitsContainer[strawberryProductNumber])
        case .bananaJuice:
            bananaCount = juiceMaker.checkStockAmount(of: juiceMaker.fruitsContainer[bananaProductNumber])
        case .pineappleJuice:
            pineappleCount = juiceMaker.checkStockAmount(of: juiceMaker.fruitsContainer[pineappleProductNumber])
        case .mangoJuice:
            mangoCount = juiceMaker.checkStockAmount(of: juiceMaker.fruitsContainer[mangoProductNumber])
        case .kiwiJuice:
            kiwiCount = juiceMaker.checkStockAmount(of: juiceMaker.fruitsContainer[kiwiProductNumber])
        }
    }
    
    private func makeSuccessMessage(of menu: JuiceMenu) -> String {
        return "\(menu.rawValue) 가 완성되었습니다. 맛있게 드세요 :)"
    }
    
    private func makeFailMessage() -> String {
        return "재료가 모자라요. 재고를 수정할까요?"
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

