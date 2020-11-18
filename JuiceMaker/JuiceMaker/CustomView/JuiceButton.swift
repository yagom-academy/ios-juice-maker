//
//  JuiceButton.swift
//  JuiceMaker
//
//  Created by Wonhee on 2020/11/19.
//

import Foundation
import UIKit

class JuiceButton : UIButton {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        self.backgroundColor = UIColor.systemIndigo
        self.setTitleColor(.white, for: .normal)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }

}
