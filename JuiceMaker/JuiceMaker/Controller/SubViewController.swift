//
//  SubViewController.swift
//  JuiceMaker
//
//  Created by 사파리 and Red on 2022/03/07.
//

import UIKit

class SubViewController: UIViewController {
    var stockNumber: String?

    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBAction func closeView(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabel()
    }
    
    func updateLabel() {
        self.strawberryLabel.text = stockNumber ?? "0"
//        self.bananaLabel
//        self.pineappleLabel
//        self.kiwiLabel
//        self.mangoLabel
    }
    


}
