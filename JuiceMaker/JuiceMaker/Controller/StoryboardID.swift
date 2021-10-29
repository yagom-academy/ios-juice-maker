//
//  StoryboardID.swift
//  JuiceMaker
//
//  Created by Seul Mac on 2021/10/29.
//

import Foundation

enum Storyboard {
    case EditStockViewController
    
    var ID: String {
        switch self {
        case .EditStockViewController:
            return "EditStockNavigation"
        }
    }
}
