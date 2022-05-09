//
//  MakerViewController.swift
//  JuiceMaker
//
//  Created by Kay on 2022/05/02.
//

import UIKit

class MakerViewController: UIViewController {
    var juiceMaker = JuiceMaker()
    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addJuiceObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bringFruitCount()
    }
    
    func setUpStockValues() {
        guard let stockViewController = self.storyboard?.instantiateViewController(withIdentifier: "stockChangeView") as? ViewController
        else { return }
        stockViewController.MakerController = self
        self.navigationController?.pushViewController(stockViewController, animated: true)
    }
    
    func receiveEditedFruitCount(receivedStock: Dictionary<FruitKind,Int>) {
        juiceMaker.updateTotalAmount(editedStock: receivedStock)
    }
    
    func retrieveFruitCount(fruitName: FruitKind) -> String {
        return juiceMaker.fruitCount(fruitName: fruitName)
    }
    
    @IBAction func changeStockValues(_ sender: UIButton) {
        setUpStockValues()
    }
    
    func addJuiceObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(takeJuiceOrder(_:)), name: Notification.Name.identifier, object: nil)
    }
    
    @objc func takeJuiceOrder(_ juiceInfomation: Notification) throws {
        guard let juiceName = juiceInfomation.userInfo?[JuiceInfo.JuiceName] as? String
        else { return }
        
        let whitespaceRemovedName = juiceName.replacingOccurrences(of: " ", with: "")
        let completeName = whitespaceRemovedName.replacingOccurrences(of: "\n", with: "")
        
        var kindOfJuice: JuiceKind
        
        switch completeName {
        case JuiceKind.strawberryBananaJuice.juiceNameRecognize:
            kindOfJuice = .strawberryBananaJuice
        case JuiceKind.mangoKiwiJuice.juiceNameRecognize:
            kindOfJuice = .mangoKiwiJuice
        case JuiceKind.strawberryJuice.juiceNameRecognize:
            kindOfJuice = .strawberryJuice
        case JuiceKind.bananaJuice.juiceNameRecognize:
            kindOfJuice = .bananaJuice
        case JuiceKind.pineappleJuice.juiceNameRecognize:
            kindOfJuice = .pineappleJuice
        case JuiceKind.kiwiJuice.juiceNameRecognize:
            kindOfJuice = .kiwiJuice
        case JuiceKind.mangoJuice.juiceNameRecognize:
            kindOfJuice = .mangoJuice
        default:
            kindOfJuice = .none
        }
        do {
            try juiceMaker.makeJuice(juiceName: kindOfJuice)
            successAlert(juiceName: kindOfJuice.juiceNameInKorean)
        } catch ErrorCategory.zeroError {
            failAlert()
            bringFruitCount()
        }
    }
    
    func bringFruitCount() {
        strawberryCountLabel.text = retrieveFruitCount(fruitName: .strawberry)
        bananaCountLabel.text = retrieveFruitCount(fruitName: .banana)
        pineappleCountLabel.text = retrieveFruitCount(fruitName: .pineapple)
        kiwiCountLabel.text = retrieveFruitCount(fruitName: .kiwi)
        mangoCountLabel.text = retrieveFruitCount(fruitName: .mango)
    }
    
    func successAlert(juiceName: String) {
        let alert = UIAlertController(title: nil, message: "\(juiceName) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let successAction = UIAlertAction(title: "OK", style: .default, handler: { _ in self.bringFruitCount() })
        alert.addAction(successAction)
        present(alert, animated: true, completion: nil)
    }
    
    func failAlert() {
        let alert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default, handler: { _ in self.setUpStockValues() })
        let noAction = UIAlertAction(title: "아니오", style: .destructive)
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func orderProcess(buttonName: UIButton) {
        guard let juiceButtonName = buttonName.currentTitle else { return }
        NotificationCenter.default.post(name: Notification.Name.identifier, object: nil, userInfo: [JuiceInfo.JuiceName : juiceButtonName])
    }
}
