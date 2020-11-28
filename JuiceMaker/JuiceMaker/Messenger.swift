//
//  Messenger.swift
//  JuiceMaker
//
//  Created by 김태형 on 2020/11/27.
//

import Foundation

class Messenger {
    func printAlertMessage(alertCase: AlertCase) {
        switch alertCase {
        case .outOfStock:
            print(AlertMessage.outOfStock.rawValue)
        case .wrongRequest:
            print(AlertMessage.wrongRequest.rawValue)
        default:
            return
        }
    }
    
    func printSuccessMade(orderedJuiceName: Menu) {
        print("\(orderedJuiceName.rawValue)" + AlertMessage.successMade.rawValue)
    }
}
