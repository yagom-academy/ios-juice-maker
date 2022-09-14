//
//  Created by Baem, Jeremy
//
//
import UIKit

class Alerter {
    var title: String
    var message: String
    var isPresentable: Bool
    var viewController: JuiceMakerViewController?
    var alertController: UIAlertController
    
    init(title: String, message: String, isPresentable: Bool, presentOn viewController: JuiceMakerViewController?) {
        self.viewController = viewController
        self.title = title
        self.message = message
        self.alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.isPresentable = isPresentable
        
        if isPresentable {
            alertController.addAction(UIAlertAction(title: "Cancel", style: .default))
            alertController.addAction(UIAlertAction(title: "Ok", style: .default) { _ in
                self.viewController?.presentStockEditorViewController()
            })
        } else {
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        }
    }
}
