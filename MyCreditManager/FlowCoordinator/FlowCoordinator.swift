//
//  FlowCoordinator.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/18.
//

import Foundation

final class FlowCoordinator {
  
  let inputController: InputController
  let outputController: MenuController
  
  init(inputController: InputController, outputController: MenuController) {
    self.inputController = inputController
    self.outputController = outputController
  }
  
  func start() {
    while true {
      outputController.displayOpeningPhrase()  
      self.processInput(inputController.read())
      self.processInput(inputController.read())
    }
  }
  
  private func processInput(_ userInput: String) {
    outputController.proceedUserInput(on: userInput)
  }
}
