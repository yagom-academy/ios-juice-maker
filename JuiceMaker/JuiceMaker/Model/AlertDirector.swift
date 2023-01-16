//
//  AlertDirector.swift
//  JuiceMaker
//
//  Created by 천승현 on 2023/01/13.
//

import UIKit

final class AlertDirector {
    private var builder: Builder?
    
    func buildSuccessAlert(_ builder: Builder, with targetJuice: FruitJuice) {
        _ = builder
            .setTitle(AlertMessage.success)
            .setMessage("\(targetJuice.rawValue)" + AlertMessage.makeJuiceMessage)
            .setAlertAction(title: AlertMessage.yes, style: .default)
    }
    
    func buildOutOfStockAlert(_ builder: Builder) {
        _ = builder
            .setTitle(AlertMessage.failure)
            .setMessage(AlertMessage.outOfStockMessage)
            .setAlertAction(title: AlertMessage.no, style: .cancel)
            .setAlertAction(title: AlertMessage.yes, style: .default)
    }
    
    func buildUnknownAlert(_ builder: Builder) {
        _ = builder
            .setTitle(AlertMessage.unknownError)
            .setMessage(AlertMessage.unknwonErrorMessage)
            .setAlertAction(title: AlertMessage.yes, style: .default)
    }
}
