//
//  JuiceButton.swift
//  JuiceMaker
//
//  Created by Wonhee on 2020/11/19.
//

import Foundation
import UIKit

class JuiceButton : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(title: String) {
        super.init(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
        setup(title)
    }
    
    func setup(_ title: String) {
        self.backgroundColor = UIColor.systemIndigo
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitle("\(title)\n주문", for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.textAlignment = .center
    }

}
