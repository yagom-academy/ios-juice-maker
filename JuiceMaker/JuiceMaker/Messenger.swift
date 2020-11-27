//
//  Messenger.swift
//  JuiceMaker
//
//  Created by 김태형 on 2020/11/27.
//

import Foundation

class Messenger {
    func printOutOfStock() {
        print(AlertMessage.outOfStock.rawValue)
    }
    
    func printWrongRequest() {
        print(AlertMessage.wrongRequest.rawValue)
    }
    
    func printSuccessMade(juice: Menu) {
        print("\(juice.rawValue)" + AlertMessage.successMade.rawValue)
    }
}
