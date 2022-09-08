//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by parkhyo on 2022/09/02.
//

import UIKit

class ModifyStockViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func setNavigationBar() {
        self.title = ConstantSentence.modifyStockTitle
        self.navigationController?.navigationBar.backgroundColor = .lightGray
    }
    
}
