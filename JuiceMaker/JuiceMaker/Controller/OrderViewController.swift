//
//  OrderViewController.swift
//  JuiceMaker
//
//  Created by jaeyoung Yun on 2022/02/16.
//

import UIKit
import RxCocoa
import RxSwift

class OrderViewController: UIViewController {
  var viewModel: OrderViewModelType?
  var disposeBag = DisposeBag()
  
  @IBOutlet weak var changeStockBarButton: UIBarButtonItem!
  
  @IBOutlet weak var strawberryStockLabel: UILabel!
  @IBOutlet weak var bananaStockLabel: UILabel!
  @IBOutlet weak var pineappleStockLabel: UILabel!
  @IBOutlet weak var kiwiStockLabel: UILabel!
  @IBOutlet weak var mangoStockLabel: UILabel!
  
  @IBOutlet weak var orderStrawberryBananaJuiceButton: UIButton!
  @IBOutlet weak var orderStrawberryJuiceButton: UIButton!
  @IBOutlet weak var orderBananaJuiceButton: UIButton!
  @IBOutlet weak var orderPineappleJuiceButton: UIButton!
  @IBOutlet weak var orderKiwiJuiceButton: UIButton!
  @IBOutlet weak var orderMangoJuiceButton: UIButton!
  @IBOutlet weak var orderMangoKiwiJuiceButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    subscribeUI()
    bind()
  }
  
  // MARK: - subscribe
  
  private func subscribeUI() {
    orderStrawberryBananaJuiceButton.rx.tap
      .subscribe(with: self, onNext: { owner, _ in
        owner.viewModel?.order(juice: .strawberryBanana)
      })
      .disposed(by: disposeBag)
    
    orderStrawberryJuiceButton.rx.tap
      .subscribe(with: self, onNext: { owner, _ in
        owner.viewModel?.order(juice: .strawberry)
      })
      .disposed(by: disposeBag)
    
    orderBananaJuiceButton.rx.tap
      .subscribe(with: self, onNext: { owner, _ in
        owner.viewModel?.order(juice: .banana)
      })
      .disposed(by: disposeBag)
    
    orderPineappleJuiceButton.rx.tap
      .subscribe(with: self, onNext: { owner, _ in
        owner.viewModel?.order(juice: .pineapple)
      })
      .disposed(by: disposeBag)
    
    orderKiwiJuiceButton.rx.tap
      .subscribe(with: self, onNext: { owner, _ in
        owner.viewModel?.order(juice: .kiwi)
      })
      .disposed(by: disposeBag)
    
    orderMangoJuiceButton.rx.tap
      .subscribe(with: self, onNext: { owner, _ in
        owner.viewModel?.order(juice: .mango)
      })
      .disposed(by: disposeBag)
    
    orderMangoKiwiJuiceButton.rx.tap
      .subscribe(with: self, onNext: { owner, _ in
        owner.viewModel?.order(juice: .mangoKiwi)
      })
      .disposed(by: disposeBag)
    
    changeStockBarButton.rx.tap
      .subscribe(with: self, onNext: { owner, _ in
        owner.goToStock()
      })
      .disposed(by: disposeBag)
  }
  
  // MARK: - bind
  
  private func bind() {
    viewModel?.juiceObservable
      .subscribe(
        with: self,
        onNext: { owner, result in
          switch result {
          case .success(let juice):
            owner.showSuccessAlert(juice)
          case .failure:
            owner.showNotEnoughStockAlert()
          }
        }
      )
      .disposed(by: disposeBag)
  }
  
  private func showSuccessAlert(_ juice: Juice) {
    let alert = UIAlertController(
      title: nil,
      message: "\(juice.name) 쥬스 나왔습니다! 맛있게 드세요!",
      preferredStyle: .alert
    )
    
    let confirmAction = UIAlertAction(title: "확인", style: .default)
    alert.addAction(confirmAction)
    
    self.present(alert, animated: true, completion: nil)

  }
  
  private func showNotEnoughStockAlert() {
    let alert = UIAlertController(
      title: nil,
      message: "재료가 모자라요. 재고를 수정할까요?",
      preferredStyle: .alert
    )
    
    let confirmAction = UIAlertAction(title: "예", style: .default) { [weak self] _ in
      self?.goToStock()
    }
    let cancelAction = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
    
    alert.addAction(confirmAction)
    alert.addAction(cancelAction)
    
    self.present(alert, animated: true, completion: nil)
  }
  
  private func goToStock() {
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let stockViewController = mainStoryboard.instantiateViewController(withIdentifier: "StockViewController")
    
    self.present(stockViewController, animated: true, completion: nil)
  }
}
