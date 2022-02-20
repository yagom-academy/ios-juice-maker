//
//  StoryboardBindable.swift
//  JuiceMaker
//
//  Created by 박형석 on 2022/02/16.
//

import UIKit

protocol StoryboardBindable {
    static func instantiate(_ fruitStore: FruitStore?) -> Self
}

extension StoryboardBindable where Self: BaseViewController {
    static func instantiate(_ fruitStore: FruitStore? = nil) -> Self {
        let fullName: String = NSStringFromClass(self)
        let className: String = fullName.components(separatedBy: ".")[1]
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController: Self = storyboard.instantiateViewController(withIdentifier: className) as! Self
        viewController.fruitStore = fruitStore
        return viewController
    }
}
