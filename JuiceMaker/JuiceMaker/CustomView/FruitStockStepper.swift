//
//  FruitStockStepper.swift
//  JuiceMaker
//
//  Created by 윤재웅 on 2021/03/19.
//

import UIKit

final class FruitStockStepper: UIView {
    private(set) var kindFruit: Fruits?
    private var leftButton = StepperButton(type: .system)
    private var rightButton = StepperButton(type: .system)
    private var centerLabel = UILabel()
    private let upValue = 1
    private let downValue = -1
    
    private(set) var value: Int = 0 {
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
        self.leftButton.stepperButtonSetting(updownValue: upValue, updownShape: "↡", color: UIColor.red.cgColor)
        self.rightButton.stepperButtonSetting(updownValue: downValue, updownShape: "↟", color: UIColor.blue.cgColor)
        
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
    
    @objc private func valueChange(_ sender: UIButton) {
        if value + sender.tag < 0 {
            return
        } else {
            self.value += sender.tag
        }
    }
    
    override func layoutSubviews() {
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

