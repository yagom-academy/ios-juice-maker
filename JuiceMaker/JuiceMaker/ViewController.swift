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
        
        guard juiceMaker.isAvailableMaking(juice: orderedMenu) else {
            let alertMessage = makeFailMessage()
            showFailedAlert(by: alertMessage)
            return
        }
        
        let resultOfMaker = juiceMaker.makeJuice(of: orderedMenu)
        let alertMessage = makeSuccessMessage(with: resultOfMaker)
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
        strawberryCount = juiceMaker.strawberryStock
        bananaCount = juiceMaker.bananaStock
        pineappleCount = juiceMaker.pineappleStock
        kiwiCount = juiceMaker.kiwiStock
        mangoCount = juiceMaker.mangoStock
    }
    
    private func initializeMenuOrder() {
        menuMap[ddalbaOrderButton] = juiceMaker.ddalbaJuice
        menuMap[mankiOrderButton] = juiceMaker.mangoKiwiJuice
        menuMap[strawberryOrderButton] = juiceMaker.strawberryJuice
        menuMap[bananaOrderButton] = juiceMaker.bananaJuice
        menuMap[pineappleOrderButton] = juiceMaker.pineappleJuice
        menuMap[kiwiOrderButton] = juiceMaker.kiwiJuice
        menuMap[mangoOrderButton] = juiceMaker.mangoJuice
    }
    
    private func updateStockStatusAfterMaking(order: JuiceMenu) {
        switch order {
        case .ddalbaJuice:
            strawberryCount = juiceMaker.strawberryStock
            bananaCount = juiceMaker.bananaStock
        case .mangoKiwiJuice:
            mangoCount = juiceMaker.mangoStock
            kiwiCount = juiceMaker.kiwiStock
        case .strawberryJuice:
            strawberryCount = juiceMaker.strawberryStock
        case .bananaJuice:
            bananaCount = juiceMaker.bananaStock
        case .pineappleJuice:
            pineappleCount = juiceMaker.pineappleStock
        case .mangoJuice:
            mangoCount = juiceMaker.mangoStock
        case .kiwiJuice:
            kiwiCount = juiceMaker.kiwiStock
        }
    }
    
    private func makeSuccessMessage(with juiceName: String) -> String {
        return "\(juiceName)이 완성되었습니다. 맛있게 드세요 :)"
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

