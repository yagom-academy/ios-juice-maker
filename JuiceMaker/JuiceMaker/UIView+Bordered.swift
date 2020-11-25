//
//  UIView+Bordered.swift
//  JuiceMaker
//
//  Created by Yeon on 2020/11/16.
//
import UIKit

@IBDesignable extension UIView {
    
    @IBInspectable var boarderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
    }
}
