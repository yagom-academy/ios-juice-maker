//
//  FruitStockStepper.swift
//  JuiceMaker
//
//  Created by 윤재웅 on 2021/03/19.
//

import UIKit

@IBDesignable
final class FruitStockStepper: UIView {
    private var juiceMaker = JuiceMaker.shared
    private(set) var kindFruit: Fruits?
    
    public var leftButton = UIButton(type: .system)
    public var rightButton = UIButton(type: .system)
    public var centerLabel = UILabel()
    
    public var value: Int = 0 {
        didSet {
            self.centerLabel.text = String(value)
        }
    }
 
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    convenience init(fruit: Fruits) {
        self.init()
        self.kindFruit = fruit
    }
    
    private func setup() {
        self.leftButton.tag = -1
        self.leftButton.setTitle("↡", for: .normal)
        self.leftButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.leftButton.layer.borderWidth = 1
        self.leftButton.layer.borderColor = UIColor.blue.cgColor
        
        self.rightButton.tag = 1
        self.rightButton.setTitle("↟", for: .normal)
        self.rightButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.rightButton.layer.borderWidth = 1
        self.rightButton.layer.borderColor = UIColor.red.cgColor
        
        self.centerLabel.text = String(value)
        self.centerLabel.font = UIFont.systemFont(ofSize: 16)
        self.centerLabel.textAlignment = .center
        self.centerLabel.backgroundColor = .systemGray4
        self.centerLabel.sizeToFit()
        
        self.addSubview(self.leftButton)
        self.addSubview(self.rightButton)
        self.addSubview(self.centerLabel)
        
        self.leftButton.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
        self.rightButton.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
    }
    
    @objc public func valueChange(_ sender: UIButton) {
        if value + sender.tag < 0 {
            return
        } else {
            self.value += sender.tag
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        let buttonWidth = self.frame.height
        let labelWidth = self.frame.width - (buttonWidth * 2)
        
        self.leftButton.frame = CGRect(x: 0, y: 0, width: buttonWidth, height: buttonWidth)
        self.centerLabel.frame = CGRect(x: buttonWidth, y: 0, width: labelWidth, height: buttonWidth)
        self.rightButton.frame = CGRect(x: buttonWidth + labelWidth, y: 0, width: buttonWidth, height: buttonWidth)
    }
    
    func initStepper(amount: Int?) {
        guard let amount = amount else {
            return
        }
        self.value = amount
    }
}

