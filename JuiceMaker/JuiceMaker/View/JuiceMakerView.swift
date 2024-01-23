//
//  JuiceMakerView.swift
//  JuiceMaker
//
//  Created by Jaehun Lee on 1/23/24.
//

import UIKit

protocol JuiceMakerViewDelegate {
    func juiceMakerViewStockEditButtonSelected(_ view: JuiceMakerView)
}

class JuiceMakerView: UIView {
    var delegate: JuiceMakerViewDelegate!
    
    @IBAction func touchUpStockEditButton(_ sender: UIBarButtonItem) {
        
    }
    
}


