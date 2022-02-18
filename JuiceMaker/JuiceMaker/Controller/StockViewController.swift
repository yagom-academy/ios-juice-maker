//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by soyounglee on 2022/02/16.
//

import UIKit
import RxSwift
import RxCocoa

protocol StockViewDelegate {
  func stockViewDidDismissed()
}

class StockViewController: UIViewController {
  var viewModel: StockViewModelType?
  weak var coordinator: MainCoordinatable?
  let disposeBag = DisposeBag()
  var delegate: StockViewDelegate?
  
  @IBOutlet weak var closeButton: UIButton!
  @IBOutlet weak var strawberryStockLabel: UILabel!
  @IBOutlet weak var bananaStockLabel: UILabel!
  @IBOutlet weak var pineappleStockLabel: UILabel!
  @IBOutlet weak var kiwiStockLabel: UILabel!
  @IBOutlet weak var mangoStockLabel: UILabel!
  
  @IBOutlet weak var strawberryMinusButton: UIButton!
  @IBOutlet weak var strawberryPlusButton: UIButton!
  @IBOutlet weak var bananaMinusButton: UIButton!
  @IBOutlet weak var bananaPlusButton: UIButton!
  @IBOutlet weak var pineappleMinusButton: UIButton!
  @IBOutlet weak var pineapplePlusButton: UIButton!
  @IBOutlet weak var kiwiMinusButton: UIButton!
  @IBOutlet weak var kiwiPlusButton: UIButton!
  @IBOutlet weak var mangoMinusButton: UIButton!
  @IBOutlet weak var mangoPlusButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    subscribeUI()
    bind()
  }
  
  private func subscribeUI() {
    closeButton.rx.tap
      .subscribe(with: self, onNext: { owner, _ in
        owner.dismiss(animated: true)
        owner.delegate?.stockViewDidDismissed()
      })
      .disposed(by: disposeBag)
    
    strawberryMinusButton.rx.tap
      .subscribe(with: self, onNext: { owner, _ in
        owner.viewModel?.decreaseStock(fruit: .strawberry)
      })
      .disposed(by: disposeBag)
    
    bananaMinusButton.rx.tap
      .subscribe(with: self, onNext: { owner, _ in
        owner.viewModel?.decreaseStock(fruit: .banana)
      })
      .disposed(by: disposeBag)
    
    pineappleMinusButton.rx.tap
      .subscribe(with: self, onNext: { owner, _ in
        owner.viewModel?.decreaseStock(fruit: .pineapple)
      })
      .disposed(by: disposeBag)
    
    kiwiMinusButton.rx.tap
      .subscribe(with: self, onNext: { owner, _ in
        owner.viewModel?.decreaseStock(fruit: .kiwi)
      })
      .disposed(by: disposeBag)
    
    mangoMinusButton.rx.tap
      .subscribe(with: self, onNext: { owner, _ in
        owner.viewModel?.decreaseStock(fruit: .mango)
      })
      .disposed(by: disposeBag)
    
    strawberryPlusButton.rx.tap
      .subscribe(with: self, onNext: { owner, _ in
        owner.viewModel?.increaseStock(fruit: .strawberry)
      })
      .disposed(by: disposeBag)
    
    bananaPlusButton.rx.tap
      .subscribe(with: self, onNext: { owner, _ in
        owner.viewModel?.increaseStock(fruit: .banana)
      })
      .disposed(by: disposeBag)
    
    pineapplePlusButton.rx.tap
      .subscribe(with: self, onNext: { owner, _ in
        owner.viewModel?.increaseStock(fruit: .pineapple)
      })
      .disposed(by: disposeBag)
    
    kiwiPlusButton.rx.tap
      .subscribe(with: self, onNext: { owner, _ in
        owner.viewModel?.increaseStock(fruit: .kiwi)
      })
      .disposed(by: disposeBag)
    
    mangoPlusButton.rx.tap
      .subscribe(with: self, onNext: { owner, _ in
        owner.viewModel?.increaseStock(fruit: .mango)
      })
      .disposed(by: disposeBag)
  }
  
  private func bind() {
    viewModel?.strawberryStockObserbable
      .map { "\($0)" }
      .bind(to: strawberryStockLabel.rx.text)
      .disposed(by: disposeBag)
    
    viewModel?.bananaStockObserbable
      .map { "\($0)" }
      .bind(to: bananaStockLabel.rx.text)
      .disposed(by: disposeBag)
    
    viewModel?.pineappleStockObserbable
      .map { "\($0)" }
      .bind(to: pineappleStockLabel.rx.text)
      .disposed(by: disposeBag)
    
    viewModel?.kiwiStockObserbable
      .map { "\($0)" }
      .bind(to: kiwiStockLabel.rx.text)
      .disposed(by: disposeBag)
    
    viewModel?.mangoStockObserbable
      .map { "\($0)" }
      .bind(to: mangoStockLabel.rx.text)
      .disposed(by: disposeBag)
  }
}
