//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private var juiceMaker: JuiceMaker!
    private var labelList = [Fruit: UILabel]()
    // MARK: - IBOutlet
    @IBOutlet weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    // MARK: - Method
    override func viewDidLoad() {
        super.viewDidLoad()
        let fruitStore = FruitStore()
        juiceMaker = JuiceMaker(fruitStore: fruitStore)
        initLabelList()
        initLabelsText(of: fruitStore)
    }
    
    func initLabelList() {
        labelList[.strawberry] = strawberryLabel
        labelList[.banana] = bananaLabel
        labelList[.pineapple] = pineappleLabel
        labelList[.kiwi] = kiwiLabel
        labelList[.mango] = mangoLabel
    }
    
    func initLabelsText(of fruitStore: FruitStore) {
        do {
            let fruitList = Fruit.makeFruitList()
            for fruit in fruitList {
                let fruitStock = try fruitStore.getStocks(of: fruit)
                if let uiLabel = labelList[fruit] {
                    uiLabel.text = "\(fruitStock)"
                }
            }
        } catch {
            
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
    
    func orderJuice(of juice: Juice) {
        showAlert(title: "주문완료", message: "\(juice) 쥬스 나왔습니다! 맛있게 드세요!")
    }
    
    // MARK: - IBAction
    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
        orderJuice(of: .strawberryBanana)
    }
    
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
        orderJuice(of: .mangoKiwi)
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        orderJuice(of: .strawberry)
    }
    
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        orderJuice(of: .banana)
    }
    
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
        orderJuice(of: .pineapple)
    }
    
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        orderJuice(of: .kiwi)
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        orderJuice(of: .mango)
    }
}
