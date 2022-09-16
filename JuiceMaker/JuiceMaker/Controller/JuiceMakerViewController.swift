//
//  Created by Baem, Jeremy
//
//

import UIKit

class JuiceMakerViewController: UIViewController, DidDissmissDelegate {
    func didDismissModal() {
        setLabelValue()
    }
    
    
    @IBOutlet weak var strawBerryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineAppleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawBerryBananaButton: UIButton!
    @IBOutlet weak var mangoKiwiButton: UIButton!
    @IBOutlet weak var strawBerryButton: UIButton!
    @IBOutlet weak var bananaButton: UIButton!
    @IBOutlet weak var pineAppleButton: UIButton!
    @IBOutlet weak var kiwiButton: UIButton!
    @IBOutlet weak var mangoButton: UIButton!
    
    private var observation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StockEditorViewController.delegate = self
        setLabelValue()
    }
    
    @IBAction func tapStrawBerryBananaButton(_ sender: UIButton) {
        orderJuice(juice: .strawBerryBanana)
    }
    
    @IBAction func tapMangoKiwiButton(_ sender: UIButton) {
        orderJuice(juice: .mangoKiwi)
    }
    
    @IBAction func tapStrawBerryButton(_ sender: UIButton) {
        orderJuice(juice: .strawBerry)
    }
    
    @IBAction func tapBananaButton(_ sender: UIButton) {
        orderJuice(juice: .banana)
    }
    
    @IBAction func tapPineAppleButton(_ sender: UIButton) {
        orderJuice(juice: .pineApple)
    }
    
    @IBAction func tapKiwiButton(_ sender: UIButton) {
        orderJuice(juice: .kiwi)
    }
    
    @IBAction func tapMangoButton(_ sender: UIButton) {
        orderJuice(juice: .mango)
    }
    
    func orderJuice(juice: Juice) {
        if requestStockAvailability(for: juice) {
            JuiceMaker.sharedStore.useStockForRecipe(of: juice)
            presentAlertOrderIsReady(juice)
        } else {
            presentAlertNotEnoughStock(data: juice.recipe)
        }
        setLabelValue()
    }
    
    private func setLabelValue() {
        strawBerryLabel.text = JuiceMaker.sharedStore.stock[Fruit.strawBerry.rawValue]?.description
        bananaLabel.text = JuiceMaker.sharedStore.stock[Fruit.banana.rawValue]?.description
        pineAppleLabel.text = JuiceMaker.sharedStore.stock[Fruit.pineApple.rawValue]?.description
        kiwiLabel.text = JuiceMaker.sharedStore.stock[Fruit.kiwi.rawValue]?.description
        mangoLabel.text = JuiceMaker.sharedStore.stock[Fruit.mango.rawValue]?.description
    }
    
    func presentStockEditorViewController() {
        guard let stockEditorViewController = self.storyboard?.instantiateViewController(withIdentifier: "StockEditorNavigationViewController") else { return }
        self.present(stockEditorViewController, animated: true)
    }
    
    private func presentAlertOrderIsReady(_ juice: Juice) {
        let alert = Alerter(title: "완성",
                            message: "\(juice.rawValue) 나왔습니다! 맛있게 드세요!",
                            isPresentable: false,
                            presentOn: self).alertController
        
        return present(alert, animated: true)
    }
    
    private func presentAlertNotEnoughStock(data: [Fruit: Int]) {
        let alert = Alerter(title: "Hello!",
                            message: "재료가 모자라요.\n \(getInsufficientFruitInformation(from: data))\n재고를 수정할까요?",
                            isPresentable: true,
                            presentOn: self).alertController
        
        return present(alert, animated: true)
        
    }
    
    private func getInsufficientFruitInformation(from data: [Fruit: Int]) -> String {
        var result: [String] = []
        for (fruit, count) in data {
            if count > JuiceMaker.sharedStore.stock[fruit.rawValue]! {
                result.append("\(fruit.rawValue)가 \(count - JuiceMaker.sharedStore.stock[fruit.rawValue]!)개")
            }
        }
        
        return result.joined(separator: "\n")
    }
    
    private func requestStockAvailability(for juice: Juice) -> Bool {
        do {
            try JuiceMaker.sharedStore.checkStockAvailability(of: juice)
            return true
        } catch StockError.notEnoughFruit {
            print("재고 부족")
        } catch {
            print("Unknown Error")
        }
        return false
    }
}

