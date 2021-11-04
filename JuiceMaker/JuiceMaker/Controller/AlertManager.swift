//
//  AlertManager.swift
//  JuiceMaker
//
//  Created by Jun Bang on 2021/11/04.
//

import UIKit

struct AlertManager {
    enum AlertTitle: String, CustomStringConvertible {
        case success = "나왔습니다"
        case fail = "재료가 모자라요"
        case error = "오류가 발생했어요🥲"
        case excessiveReduction = "더 이상 줄일 수 없어요😰"
    
        var description: String {
            rawValue
        }
    }
    
    enum AlertMessage: String, CustomStringConvertible {
        case success = "맛있게 드세요!"
        case fail = "재고를 수정할까요?"
        case error = "다시 시도해주세요"
        
        var description: String {
            return rawValue
        }
    }
    
    enum AlertButtonTitle: String, CustomStringConvertible {
        case cancel = "취소"
        case ok = "확인"
        case confirm = "잘 먹겠습니다🤤"
        
        var description: String {
            return rawValue
        }
    }
    
    static func presentFailAlert(on viewController: JuiceMakerViewController) {
        let failAlert = UIAlertController(title: "\(AlertTitle.fail)", message: "\(AlertMessage.fail)", preferredStyle: .alert)
        let ok = UIAlertAction(title: "\(AlertButtonTitle.ok)", style: .default, handler: { _ in
            viewController.presentStockManagerViewController(nil)
        })
        let cancel = UIAlertAction(title: "\(AlertButtonTitle.cancel)", style: .cancel, handler: nil)
        failAlert.addAction(ok)
        failAlert.addAction(cancel)
        failAlert.preferredAction = ok
        viewController.present(failAlert, animated: true, completion: nil)
    }
    
    static func presentErrorAlert(on viewController: UIViewController) {
        let errorAlert = UIAlertController(title: "\(AlertTitle.error)", message: "\(AlertMessage.error)", preferredStyle: .alert)
        let ok = UIAlertAction(title: "\(AlertButtonTitle.ok)", style: .default, handler: nil)
        errorAlert.addAction(ok)
        viewController.present(errorAlert, animated: true, completion: nil)
    }
    
    static func presentSuccessAlert(of juice: JuiceMenu, on viewController: UIViewController) {
        let successAlert = UIAlertController(title: "\(juice) \(AlertTitle.success)", message: "\(AlertMessage.success)", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "\(AlertButtonTitle.confirm)", style: .default, handler: nil))
        viewController.present(successAlert, animated: true, completion: nil)
    }
    
    static func presentExcessiveReductionAlert(on viewController: UIViewController) {
        let errorAlert = UIAlertController(title: "\(AlertTitle.excessiveReduction)", message: "\(AlertMessage.error)", preferredStyle: .alert)
        let ok = UIAlertAction(title: "\(AlertButtonTitle.ok)", style: .default, handler: nil)
        errorAlert.addAction(ok)
        viewController.present(errorAlert, animated: true, completion: nil)
    }
}
