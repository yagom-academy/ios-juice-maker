//
//  Alert.swift
//  JuiceMaker
//
//  Created by Jiwon Yoon on 2021/06/11.
//

import Foundation
import UIKit

enum Message: String {
    case orderSuccess = " 나왔습니다! 맛있게 드세요!"
    case outOfStock = "재료가 모자라요. 재고를 수정할까요?"
}

extension UIViewController {
    var okAction: UIAlertAction {
        return UIAlertAction(title: "네!", style: .default)
    }
    var cancelAction: UIAlertAction {
        return UIAlertAction(title: "아니오", style: .default)
    }
    
    func moveToAddStockView() -> UIAlertAction {
        let moveToAddStockViewAction = UIAlertAction(title: "네", style: .default) { action in
            guard let addStockViewController = self.storyboard?.instantiateViewController(identifier: "moveToSecondViewController") else { return }
            self.present(addStockViewController, animated: true, completion: nil)
        }
        return moveToAddStockViewAction
    }
    
    func showAlert(message: String, okAction: UIAlertAction, cancelAction: UIAlertAction?) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(okAction)
        if let cancelAction = cancelAction {
            alert.addAction(cancelAction)
        }
        present(alert, animated: true, completion: nil)
    }
}
