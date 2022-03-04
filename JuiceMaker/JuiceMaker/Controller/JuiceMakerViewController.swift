import UIKit

extension Array {
    public subscript(safeIndex index: Int) -> Element? {
        guard index >= .zero, index < endIndex else {
            return nil
        }

        return self[index]
    }
}

final class JuiceMakerViewController: UIViewController {
    @IBOutlet private var fruitLabelCollection: [UILabel]!
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateFruitsStock()
    }
    
    private func updateFruitsStock() {
        for (index, stock) in juiceMaker.getFruitsStock().enumerated() {
            guard let fruitLabel = fruitLabelCollection[safeIndex: index] else {
                return
            }
            fruitLabel.text = String(stock)
        }
    }
    
    private func showSuccessAlert(juice: Juice) {
        let successAlert = UIAlertController(title: "\(juice)  나왔습니다", message: "맛있게드세요", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "네", style: .default))
        present(successAlert, animated: true)
    }
    
    private func showFailAlert() {
        let failAlert = UIAlertController(title: "재료부족", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        failAlert.addAction(UIAlertAction(title: "네", style: .default, handler: { _ in
            guard let fruitStoreVC = self.storyboard?.instantiateViewController(identifier: "FruitStoreVC") else {
                return
            }
            self.navigationController?.pushViewController(fruitStoreVC, animated: true)}))
        failAlert.addAction(UIAlertAction(title: "아니요", style: .destructive))
        present(failAlert, animated: true)
    }
    
    @IBAction func clickMakeJuiceButton(_ sender: UIButton) {
        var order: Juice
        switch sender.tag {
        case 1:
            order = .strawberryBananaJuice
        case 2:
            order = .mangoKiwiJuice
        case 3:
            order = .strawberryJuice
        case 4:
            order = .bananaJuice
        case 5:
            order = .pineappleJuice
        case 6:
            order = .kiwiJuice
        case 7:
            order = .mangoJuice
        default:
            order = .strawberryJuice
        }
        
        switch juiceMaker.makeJuice(by: order) {
        case true:
            showSuccessAlert(juice: order)
            updateFruitsStock()
        case false:
            showFailAlert()
        }
    }
}
