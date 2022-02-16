//
//  Coordinator.swift
//  JuiceMaker
//
//  Created by soyounglee on 2022/02/16.
//

import UIKit

protocol Coordinator {
  var childCoordinators: [Coordinator] { get set }
  var navigationController: UINavigationController { get set }
  
  func start()
}
