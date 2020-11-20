//
//  FruitView.swift
//  JuiceMaker
//
//  Created by Wonhee on 2020/11/18.
//

import Foundation
import UIKit

class FruitView : UIView {
    @IBOutlet weak var fruitName: UILabel!
    @IBOutlet weak var fruitStock: UILabel!
    
    var fruit: FruitsType? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    init(fruit: FruitsType) {
        super.init(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
        self.fruit = fruit
        setup()
    }
    
    private func setup() {
        let view = Bundle.main.loadNibNamed("FruitView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
}
