//
//  UIStepper+Extensions.swift
//  JuiceMaker
//
//  Created by Derrick kim on 2022/05/09.
//

import UIKit

extension UIStepper {
    func descriptionValue() -> String {
        return convertInt().description
    }
    
    func convertInt() -> Int {
        return Int(self.value)
    }
}
