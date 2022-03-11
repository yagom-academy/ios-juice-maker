import UIKit

final class JuiceMakerViewController: UIViewController {
    @IBOutlet private var fruitLabelCollection: [UILabel]!
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitsStock()
    }
    
    @IBAction private func clickUpdateFruitStockButton(_ sender: UIBarButtonItem) {
       showFruitStoreVC()
    }
    
    @IBAction private func clickMakeJuiceButton(_ sender: UIButton) {
        guard let order = checkClickedJuice(button: sender) else {
            return
        }
    
        do {
            try juiceMaker.makeJuice(by: order)
            showSuccessAlert(juice: order)
            updateFruitsStock()
        } catch {
            showFailAlert(error)
        }
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
    
    private func showFailAlert(_ error: Error) {
        let failAlert = UIAlertController(title: "재료부족", message: error.localizedDescription, preferredStyle: .alert)
        failAlert.addAction(UIAlertAction(title: "아니요", style: .destructive))
        failAlert.addAction(UIAlertAction(title: "네", style: .default, handler: { _ in self.showFruitStoreVC()}))
        present(failAlert, animated: true)
    }
    
    private func showFruitStoreVC() {
        guard let fruitStoreVC = storyboard?.instantiateViewController(identifier: FruitStoreViewController.identifier , creator: { coder in
            FruitStoreViewController(juiceMaker: self.juiceMaker, coder: coder)
        }) else {
            return
        }

        fruitStoreVC.delegate = self

        present(fruitStoreVC, animated: true, completion: nil)
    }
    
    private func checkClickedJuice(button: UIButton) -> Juice? {
        switch button.tag {
        case 1:
            return .strawberryBananaJuice
        case 2:
            return .mangoKiwiJuice
        case 3:
            return .strawberryJuice
        case 4:
            return .bananaJuice
        case 5:
            return .pineappleJuice
        case 6:
            return .kiwiJuice
        case 7:
            return .mangoJuice
        default:
            return nil
        }
    }
}

extension JuiceMakerViewController: FruitStoreViewControllerDelegate {
    func updateFruitStock() {
        updateFruitsStock()
    }
}
