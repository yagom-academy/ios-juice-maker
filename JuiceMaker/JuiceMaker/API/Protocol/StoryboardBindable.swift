//
//  StoryboardBindable.swift
//  JuiceMaker
//
//  Created by 박형석 on 2022/02/16.
//

import UIKit

protocol StoryboardBindable {
    static func instantiate() -> Self
}

extension StoryboardBindable where Self: UIViewController {
    static func instantiate() -> Self {
        let fullName: String = NSStringFromClass(self)
        let className: String = fullName.components(separatedBy: ".")[1]
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
