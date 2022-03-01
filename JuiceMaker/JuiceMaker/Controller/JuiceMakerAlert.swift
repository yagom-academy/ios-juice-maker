//
//  AlertController.swift
//  JuiceMaker
//
//  Created by taehun kim on 2022/03/01.
//

import UIKit
extension JuiceMakerController{
    func showStockErrorAlert(){
        let alertController = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .default) { _ in
            
        }
        let cancelAction = UIAlertAction(title: "아니오", style: .default)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    func showOkAlert(title: String){
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
