//
//  Created by Baem, Jeremy
//
//

import UIKit

class JuiceMakerViewController: UIViewController {
    
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
    
    private var juiceMaker = JuiceMaker()
    private var observation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelValue()
        observation = juiceMaker.store.observe(\.stock, options: [.old, .new], changeHandler: {
            (object, changes) in
            guard let newValue = changes.newValue else { return }
            guard let oldValue = changes.oldValue else { return }
            self.updateStock(to: newValue, from: oldValue)
            self.setLabelValue()
        })
    }
    
    @IBAction func orderJuice(_ sender: UIButton) {
        if let sender = sender.titleLabel?.text?.replacingOccurrences(of: " 주문", with: ""),
            let juice = Juice(rawValue: sender) {
            if juiceMaker.requestStockAvailability(for: juice) {
                juiceMaker.store.useStockForRecipe(of: juice)
                presentAlertOrderIsReady(juice)
            } else {
                presentAlertNotEnoughStock(data: juice.recipe)
            }
        }
    }
    
    private func updateStock(to newValue: [String: Int], from oldValue: [String: Int]) {
        for fruit in newValue.keys {
            guard newValue[fruit] != oldValue[fruit],
                  let newValue = newValue[fruit] else { continue }
            juiceMaker.store.stock.updateValue(newValue, forKey: fruit)
        }
    }
    
    private func setLabelValue() {
        strawBerryLabel.text = juiceMaker.store.stock["딸기"]?.description
        bananaLabel.text = juiceMaker.store.stock["바나나"]?.description
        pineAppleLabel.text = juiceMaker.store.stock["파인애플"]?.description
        kiwiLabel.text = juiceMaker.store.stock["키위"]?.description
        mangoLabel.text = juiceMaker.store.stock["망고"]?.description
    }
    
    private func presentStockEditorViewController() {
        guard let stockEditorViewController = self.storyboard?.instantiateViewController(withIdentifier: "StockEditorViewController") else { return }
        self.present(stockEditorViewController, animated: true, completion: nil)
    }
    
    private func presentAlertOrderIsReady(_ juice: Juice) {
        let alert = UIAlertController(title: "완성!", message: "\(juice.rawValue) 나왔습니다! 맛있게 드세요!", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")})
        alert.addAction(ok)
        
        return present(alert, animated: true, completion: nil)
    }
    
    private func presentAlertNotEnoughStock(data: [Fruit: Int]) {
        var result: [String] = []
        for (fruit, count) in data {
            if count > juiceMaker.store.stock[fruit.rawValue]! {
                result.append("\(fruit.rawValue)가 \(count - juiceMaker.store.stock[fruit.rawValue]!)개")
            }
        }
        let alert = UIAlertController(title: "재고 부족!", message: "재료가 모자라요.\n \(result.joined(separator: "\n"))\n재고를 수정할까요?", preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            self.presentStockEditorViewController()
        })
        let cancle = UIAlertAction(title: "Cancle", style: .default, handler: { _ in
            NSLog("The \"Cancle\" alert occured.")})
        alert.addAction(cancle)
        alert.addAction(ok)
        
        
        return present(alert, animated: true, completion: nil)
    }
}

