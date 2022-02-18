//
//  UIAlertController+Extension.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/17.
//

import UIKit

extension UIAlertController {
    static func makeSuceesJuiceAlert(juice: String) -> UIAlertController {
        let alert = UIAlertController(title: String(format: AlertNameSpace.completeMakeJuice, juice),
                                      message: nil,
                                      preferredStyle: .alert)
        let okayAlertAction = UIAlertAction(title: AlertNameSpace.Action.submit,
                                            style: .default)
        alert.addAction(okayAlertAction)
        return alert
    }
    
    static func makeFailJuiceAlert(juice: String, count: Int?, completion: @escaping (UIAlertAction) -> Void) -> UIAlertController {
        let alert = UIAlertController(title: formatFaildTitle(juice: juice, count: count),
                                      message: nil,
                                      preferredStyle: .alert)
        let declineAlertAction = UIAlertAction(title: AlertNameSpace.Action.no,
                                              style: .cancel)
        let okayAlertAction = UIAlertAction(title: AlertNameSpace.Action.yes,
                                            style: .default, handler: completion)
        alert.addAction(declineAlertAction)
        alert.addAction(okayAlertAction)
        
        return alert
    }
    
    private static func formatFaildTitle(juice: String, count: Int?) -> String {
        guard let count = count else {
            return String(format: AlertNameSpace.notOfStock, juice)
        }
        return String(format: AlertNameSpace.notEnoughStock, juice, count)
    }
}
