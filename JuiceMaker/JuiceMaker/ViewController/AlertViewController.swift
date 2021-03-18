//
//  AlertViewController.swift
//  JuiceMaker
//
//  Created by 윤재웅 on 2021/03/17.
//

import UIKit

extension JuiceMakerViewController {
    func lakeStockAlert(_ error: Error) {
        var errorMessgae: String?
        if let juiceError = error as? JuiceMakerError {
            errorMessgae = juiceError.localizedDescription
        } else {
            errorMessgae = JuiceMakerError.unknown.localizedDescription
        }
        let failAlert = UIAlertController(title: nil , message: errorMessgae, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "아니오", style: .default)
        let stockSettingAction = UIAlertAction(title: "예", style: .cancel) { action in
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "StockManagerViewController") as? StockManagerViewController else {
                return
            }
            vc.modalPresentationStyle = .fullScreen
            self.present(vc,animated: true)
        }
        failAlert.addAction(stockSettingAction)
        failAlert.addAction(cancel)
        present(failAlert, animated: true, completion: nil)
    }

    func orderSuccessAlert(_ kindJuice: Juices) {
        let alert = UIAlertController(title: "주문 확인", message: "\(kindJuice) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
