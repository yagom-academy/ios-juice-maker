//
//  JuiceButton.swift
//  JuiceMaker
//
//  Created by 이지원 on 2022/02/20.
//

import UIKit

final class JuiceButton: UIButton {
    var juice: Juice? {
        return .init(rawValue: self.tag)
    }
}
