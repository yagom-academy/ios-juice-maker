//
//  UIView+Bordered.swift
//  JuiceMaker
//
//  Created by Yeon on 2020/11/16.
//
import UIKit

@IBDesignable extension UIView {
    
    @IBInspectable var boarderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
