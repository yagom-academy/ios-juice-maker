import Foundation
import UIKit

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
}
