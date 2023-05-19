//
//  StoryBoardable.swift
//  JuiceMaker
//
//  Created by Minsup, Serena on 2023/05/17.
//

import UIKit

protocol Storyboardable {
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle { get }
    static var storyboardIdentifier: String { get }
    static func instantiate() -> Self
}

extension Storyboardable where Self: UIViewController {
    
    static var storyboardName: String {
        return "Main"
    }

    static var storyboardBundle: Bundle {
        return .main
    }

    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        return UIStoryboard(name: storyboardName, bundle: storyboardBundle)
                .instantiateViewController(identifier: storyboardIdentifier)
    }
}

