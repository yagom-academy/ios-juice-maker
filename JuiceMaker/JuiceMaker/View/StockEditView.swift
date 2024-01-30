//
//  StockEditView.swift
//  JuiceMaker
//
//  Created by prism, gray on 1/23/24.
//

import UIKit

protocol StockEditViewDelegate: AnyObject {
    func exitStockEditView()
}

final class StockEditView: UIView {
    weak var delegate: StockEditViewDelegate?
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        delegate?.exitStockEditView()
    }
}
