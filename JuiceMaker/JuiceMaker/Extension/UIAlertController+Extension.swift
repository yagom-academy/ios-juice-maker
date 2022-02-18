//
//  UIAlertController+Extension.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/17.
//

import UIKit

extension UIAlertController {
    static func makeSuceesJuiceAlert(juice: String) -> UIAlertController {
        let alert = UIAlertController(title: String(format: AlertTitle.completeMakeJuice, juice),
                                      message: nil,
                                      preferredStyle: .alert)
        let okayAlertAction = UIAlertAction(title: AlertTitle.action.submit,
                                            style: .default)
        alert.addAction(okayAlertAction)
        return alert
    }
    
    static func makeFailJuiceAlert(juice: String, count: Int?, completion: @escaping (UIAlertAction) -> Void) -> UIAlertController {
        let alert = UIAlertController(title: formatFaildTitle(juice: juice, count: count),
                                      message: nil,
                                      preferredStyle: .alert)
        let declineAlertAction = UIAlertAction(title: AlertTitle.action.no,
                                              style: .cancel)
        let okayAlertAction = UIAlertAction(title: AlertTitle.action.yes,
                                            style: .default, handler: completion)
        alert.addAction(declineAlertAction)
        alert.addAction(okayAlertAction)
        
        return alert
    }
    
    private static func formatFaildTitle(juice: String, count: Int?) -> String {
        guard let count = count else {
            return String(format: AlertTitle.faliMakeJuice, juice)
        }
        return String(format: AlertTitle.notEnoughJuice, juice, count)
    }
}
