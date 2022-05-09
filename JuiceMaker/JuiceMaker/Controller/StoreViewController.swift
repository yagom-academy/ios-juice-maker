//
//  StoreViewController.swift
//  JuiceMaker
//
//  Created by 이원빈 on 2022/05/02.
//

import UIKit

class StoreViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    var delegate: ManangingOrderDelegate?
    var fruits: [Fruit: Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruits = delegate?.setUpStock()
        print(fruits)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }

    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
        delegate?.updateUI()
    }
    
    @IBAction func strawberryStepperDidTapped(_ sender: UIStepper) {
        
    }
    
    @IBAction func bananaStepperDidTapped(_ sender: UIStepper) {
    
    }
    
    @IBAction func pineappleStepperDidTapped(_ sender: UIStepper) {
    
    }
    
    @IBAction func kiwiStepperDidTapped(_ sender: UIStepper) {
    
    }
    
    @IBAction func mangoStepperDidTapped(_ sender: UIStepper) {
    
    }
}

extension StoreViewController {
    func updateUI() {
        self.strawberryLabel.text = fruits?[.strawberry]?.description
        self.bananaLabel.text = fruits?[.banana]?.description
        self.pineappleLabel.text = fruits?[.pineapple]?.description
        self.kiwiLabel.text = fruits?[.kiwi]?.description
        self.mangoLabel.text = fruits?[.mango]?.description
    }
}
