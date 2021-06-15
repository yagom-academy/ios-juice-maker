//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    private var juiceMaker: JuiceMaker!
    private var labelList = [Fruit: UILabel]()
    
    // MARK: - IBOutlets - UIButton
    @IBOutlet weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    
    // MARK: - IBOutlets - UILabel
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        let fruitStore = FruitStore()
        juiceMaker = JuiceMaker(fruitStore: fruitStore)
        initLabelList()
        updateLabelsText(of: fruitStore)
    }
    
    func initLabelList() {
        labelList[.strawberry] = strawberryLabel
        labelList[.banana] = bananaLabel
        labelList[.pineapple] = pineappleLabel
        labelList[.kiwi] = kiwiLabel
        labelList[.mango] = mangoLabel
    }
    
    func updateLabelsText(of fruitStore: FruitStore) {
        do {
            let fruitList = Fruit.makeFruitList()
            for fruit in fruitList {
                let fruitStock = try fruitStore.getStocks(of: fruit)
                if let uiLabel = labelList[fruit] {
                    uiLabel.text = "\(fruitStock)"
                }
            }
        } catch {
            fatalError("유효하지 않은 접근입니다.")
        }
    }
    
    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showConfirm(title: String?, message: String?, yesHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default, handler: yesHandler)
        let noAction = UIAlertAction(title: "아니오", style: .cancel)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true)
    }
    
    func moveToNavigationController(action: UIAlertAction) {
        guard let stockManagerNC = self.storyboard?.instantiateViewController(withIdentifier: "StockManagerNC") else {
            return
        }
        
        self.present(stockManagerNC, animated: true)
    }
    
    func orderJuice(of juice: Juice) {
        do {
            try juiceMaker.makeJuice(juice: juice)
            updateLabelsText(of: juiceMaker.getFruitStore())
            showAlert(title: "주문 완료", message: JuiceMaker.Message.completeMakingJuice(on: juice))
        } catch JuiceMakerError.outOfStock {
            showConfirm(title: "재고부족", message: JuiceMaker.Message.outOfStock, yesHandler: moveToNavigationController)
        } catch {
            fatalError("유효하지 않은 접근입니다.")
        }
    }
    
    // MARK: - IBActions
    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) { orderJuice(of: .strawberryBanana) }
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) { orderJuice(of: .mangoKiwi) }
    @IBAction func orderStrawberryJuice(_ sender: UIButton) { orderJuice(of: .strawberry) }
    @IBAction func orderBananaJuice(_ sender: UIButton) { orderJuice(of: .banana) }
    @IBAction func orderPineappleJuice(_ sender: UIButton) { orderJuice(of: .pineapple) }
    @IBAction func orderKiwiJuice(_ sender: UIButton) { orderJuice(of: .kiwi) }
    @IBAction func orderMangoJuice(_ sender: UIButton) { orderJuice(of: .mango) }
}
