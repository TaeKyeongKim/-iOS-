//
//  creditManager.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/22.
//

import Foundation

final class MyCreditManager {
  
  let diContainer = DIContainer()
  
  func start() {
    let flow = diContainer.makeFlowCoordinator()
    flow.start()
  }

}
