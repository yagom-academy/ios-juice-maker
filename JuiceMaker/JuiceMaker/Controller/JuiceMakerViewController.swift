//
//  JuiceMakerViewController - JuiceMakerViewController.swift
//  Created by Ash, 미니.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    private let maker = JuiceMaker()
    @IBOutlet var fruitLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockLabels()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ModifyViewController.identifier {
            guard let nabViewController = segue.destination as? UINavigationController,
                  let controller = nabViewController.viewControllers.first as? ModifyViewController else {
                return
            }
            controller.delegate = self
        }
    }
}

// Delegate 관련 메서드
extension JuiceMakerViewController: ModifyStockDelegate {
    func readCurrentStock(_ fruit: Fruit) -> Int? {
        return maker.readStock(fruit)
    }
    
    func updateStock(by fruit: Fruit, to stock: Int) {
        maker.updateStock(fruit, stock)
        updateStockLabels()
    }
}

// UI 관련 메서드
private extension JuiceMakerViewController {
    func updateStockLabels() {
        fruitLabels.forEach {
            if let fruit = Fruit(rawValue: $0.tag),
               let stock = maker.readStock(fruit) {
                $0.text = stock.description
            }
        }
    }
    
    func showAlertControllerBased(on isMaked: Bool, of juice: Juice) {
        let titleMessage = AlertMessages.title(by: isMaked)
        let message = AlertMessages.message(by: isMaked, for: juice)
        let alertController = UIAlertController(title: titleMessage, message: message, preferredStyle: .alert)
        
        let confirmMessage = AlertMessages.confirmMessage(by: isMaked)
        let okAction = UIAlertAction(title: confirmMessage, style: .default) { _ in
            if !isMaked {
                self.presentModifyController()
            }
        }
        alertController.addAction(okAction)
        if !isMaked {
            let cancelAction = UIAlertAction(title: AlertMessages.failureCancelMessage, style: .default)
            alertController.addAction(cancelAction)
        }
        
        updateStockLabels()
        present(alertController, animated: true)
    }
}

// 버튼 관련 메서드
private extension JuiceMakerViewController {
    @IBAction func didTapJuiceButton(_ sender: UIButton) {
        guard let orderedJuice = Juice(rawValue: sender.tag) else {
            return
        }
        let result = maker.makeJuice(juice: orderedJuice)
        showAlertControllerBased(on: result, of: orderedJuice)
    }
}

// 화면 이동 관련 메서드
private extension JuiceMakerViewController {
    @IBAction func didTapEditButton(_ sender: UIButton) {
        presentModifyController()
    }
    
    func presentModifyController() {
        self.performSegue(withIdentifier: ModifyViewController.identifier, sender: nil)
    }
}
