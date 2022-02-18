//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

import RxSwift
import RxCocoa

class JuiceMakerViewController: UIViewController {

    // MARK: - Properties
    
    private let disposeBag = DisposeBag()
    private var fruitStore = FruitStore()
    private lazy var juiceMaker = JuiceMaker(fruitStore: fruitStore)
    
    
    // MARK: - Interface Builder Links
    
    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceJuiceOrderButton: UIButton!
    
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindingUI()
    }
    
    
    // MARK: - Methods
    
    private func order(juice: RecipeProtocol) {
        let result = self.juiceMaker.make(with: juice)
        
        switch result {
        case .success():
            let okAction = UIAlertAction(
                title: JuiceMakerMessage.ok.description,
                style: .default
            )
            let alert = AlertFactory.create(
                message: JuiceMakerMessage.makeSuccess(juiceName: "").description,
                preferredStyle: .alert,
                actions: okAction
            )
            present(alert, animated: true)
        case.failure(_):
            let noAction = UIAlertAction(
                title: JuiceMakerMessage.no.description,
                style: .cancel
            )
            let okAction = UIAlertAction(
                title: JuiceMakerMessage.ok.description,
                style: .default
            )
            let alert = AlertFactory.create(
                message: JuiceMakerMessage.makeFail.description,
                preferredStyle: .alert,
                actions: noAction, okAction
            )
            present(alert, animated: true)
        }
    }
    

    
    
    // MARK: - Binding
    
    private func bindingUI() {
        
        // MARK: - Input
        
        bindTapStrawberryJuiceOrderButton()
        bindTapBananaJuiceOrderButton()
        bindTapPineappleJuiceOrderButton()
        bindTapKiwiJuiceOrderButton()
        bindTapMangoJuiceOrderButton()
        bindTapStrawberryBananaJuiceOrderButton()
        bindTapMangoKiwiJuiceJuiceOrderButton()
        

        // MARK: - Output
        
        bindInventory()
    }
    
    private func bindInventory() {
        self.fruitStore.inventoryObservable
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { it in
                self.strawberryCountLabel.text = String(describing: it[.strawberry] ?? 0)
                self.bananaCountLabel.text = String(describing: it[.banana] ?? 0)
                self.pineappleCountLabel.text = String(describing: it[.pineapple] ?? 0)
                self.kiwiCountLabel.text = String(describing: it[.kiwi] ?? 0)
                self.mangoCountLabel.text = String(describing: it[.mango] ?? 0)
            })
            .disposed(by: disposeBag)
    }
    
    private func bindTapStrawberryJuiceOrderButton() {
        strawberryJuiceOrderButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                guard let `self` = self else { return }
                let juice = StrawberryJuice()
                self.order(juice: juice)
            })
            .disposed(by: disposeBag)
    }
    
    private func bindTapBananaJuiceOrderButton() {
        bananaJuiceOrderButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                guard let `self` = self else { return }
                let juice = BananaJuice()
                self.order(juice: juice)
            })
            .disposed(by: disposeBag)
    }
    
    private func bindTapPineappleJuiceOrderButton() {
        pineappleJuiceOrderButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                guard let `self` = self else { return }
                let juice = PineappleJuice()
                self.order(juice: juice)
            })
            .disposed(by: disposeBag)
    }
    
    private func bindTapKiwiJuiceOrderButton() {
        kiwiJuiceOrderButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                guard let `self` = self else { return }
                let juice = KiwiJuice()
                self.order(juice: juice)
            })
            .disposed(by: disposeBag)
    }
    
    private func bindTapMangoJuiceOrderButton() {
        mangoJuiceOrderButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                guard let `self` = self else { return }
                let juice = MangoJuice()
                self.order(juice: juice)
            })
            .disposed(by: disposeBag)
    }
    
    private func bindTapStrawberryBananaJuiceOrderButton() {
        strawberryBananaJuiceOrderButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                guard let `self` = self else { return }
                let juice = StrawberryBananaJuice()
                self.order(juice: juice)
            })
            .disposed(by: disposeBag)
    }
    
    private func bindTapMangoKiwiJuiceJuiceOrderButton() {
        mangoKiwiJuiceJuiceOrderButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                guard let `self` = self else { return }
                let juice = MangoKiwiJuice()
                self.order(juice: juice)
            })
            .disposed(by: disposeBag)
    }
}
