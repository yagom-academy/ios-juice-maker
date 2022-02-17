//
//  JuiceMaker - MakeJuiceViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MakeJuiceViewController: UIViewController {

    @IBOutlet var quantityLabels: [UILabel]!
    
    @IBOutlet var orderButtons: [UIButton]!
    
    
    // 뷰에서 이루어질 비즈니스 로직을 담당할 뷰모델 생성
    private var viewModel = MakeJuiceViewModel(juiceMaker: JuiceMaker())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.displayingStocks.bind { [weak self] stocks in
            stocks.forEach { (index: Int, quantity: Quantity) in
                self?.quantityLabels[index].text = "\(quantity.text)"
            }
            
        }
        
        orderButtons.enumerated().forEach({ (index, button) in
            button.tag = index
            button.addTarget(self, action: #selector(didTap(sender:)), for: .touchUpInside)
        })
    }

    
    @objc
    private func didTap(sender: UIButton) {
        let juice = JuiceMaker.Juice(index: sender.tag)
        do {
            try viewModel.order(juice)
            let alert = CompleteMakingAlert()
            self.present(alert.alertController(), animated: true, completion: nil)
        }
        catch {
            if error as? JuiceManufacturerError == .soldOut {
                let alert = SoldOutAlert()
                self.present(alert.alertController(), animated: true, completion: nil)
            }
        }
        
    }
}
