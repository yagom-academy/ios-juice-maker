//
//  Text.swift
//  JuiceMaker
//
//  Created by 김진태 on 2021/10/28.
//

import UIKit.UIButton

enum Text {
    case cancel
    case ok
    
    var title: String {
        return localizedTitle(key: self.key)
    }
    
    private var key: String {
        switch self {
        case .cancel:
            return "Cancel"
        case .ok:
            return "OK"
        }
    }
    
    private func localizedTitle(key: String) -> String {
        let bundle = Bundle.init(for: UIButton.self)
        let title = bundle.localizedString(forKey: key, value: nil, table: nil)
        return title
    }
}
