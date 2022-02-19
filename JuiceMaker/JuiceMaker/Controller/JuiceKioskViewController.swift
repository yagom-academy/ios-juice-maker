//
//  JuiceKioskViewController.swift
//  JuiceMaker
//
//  Created by Yoojin Park on 2022/02/16.
//

import UIKit

final class JuiceKioskViewController: UIViewController {
    // MARK: - Property
    private let juiceMaker = JuiceMaker()
    private var fruitTypeOnLabels: [Fruit: UILabel] = [:]
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setFruitLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        patchData()
    }
    
    // MARK: - func
    private func setFruitLabels() {
        fruitTypeOnLabels = [.strawberry: strawberryCountLabel,
                        .banana: bananaCountLabel,
                        .pineapple: pineappleCountLabel,
                        .kiwi: kiwiCountLabel,
                        .mango: mangoCountLabel]
    }
    
    private func patchData() {
        for (fruit, label) in fruitTypeOnLabels {
            label.text = "\(juiceMaker.getFruitCount(fruit: fruit))"
        }
    }
    
    private func orderJuice(of juice: Juice) {
        do {
            let message = try juiceMaker.makeJuice(juice: juice)
            successOrderJuice(message)
        }
        catch {
            failOrderJuice(error)
        }
    }
    
    private func successOrderJuice(_ message: String) {
        self.makeAlert(title: message)  { [weak self] in
            self?.patchData()
        }
    }
    
    private func failOrderJuice(_ error: Error) {
        self.makeRequestAlert(title: error.localizedDescription) { [weak self] _ in
            self?.gotoModifyViewContoller()
        }
    }
    
    private func presentModifyViewContoller() {
        let vc = ModifyStocksViewController.instantiate(with: "Main")
        vc.juiceMaker = juiceMaker
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Action
    @IBAction private func modifyButtonTap(_ sender: Any) {
        gotoModifyViewContoller()
    }
    
    @IBAction private func orderStrawBananaberryJuiceButtonTap(_ sender: UIButton) {
        orderJuice(of: .strawberryBananaJuice)
    }
    @IBAction private func orderMangoKiwiJuiceButtonTap(_ sender: UIButton) {
        orderJuice(of: .mangoKiwiJuice)
    }
    @IBAction private func orderStrawberryJuiceButtonTap(_ sender: UIButton) {
        orderJuice(of: .strawberryJuice)
    }
    @IBAction private func orderBananaJuiceButtonTap(_ sender: UIButton) {
        orderJuice(of: .bananaJuice)
    }
    @IBAction private func orderPineappleJuiceButtonTap(_ sender: UIButton) {
        orderJuice(of: .pineappleJuice)
    }
    @IBAction private func orderKiwiJuiceButtonTap(_ sender: UIButton) {
        orderJuice(of: .kiwiJuice)
    }
    @IBAction private func orderMangoJuiceButtonTap(_ sender: UIButton) {
        orderJuice(of: .mangoJuice)
    }
    
    // MARK: - Outlet Property
    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
}
