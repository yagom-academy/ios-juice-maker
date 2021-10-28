//
//  SegueIdentifier.swift
//  JuiceMaker
//
//  Created by 박병호 on 2021/10/26.
//

import Foundation

enum StoryboardSegue {
    case toStockModifyView
    
    var identifier: String {
        switch self {
        case .toStockModifyView:
            return "toStockModifyView"
        }
    }
}
