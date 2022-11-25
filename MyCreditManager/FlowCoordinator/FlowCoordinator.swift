//
//  FlowCoordinator.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/18.
//

import Foundation

struct FlowCoordinator {
  
  let inputController: InputController
  let outputController: MenuController
  
  init(inputController: InputController, outputController: MenuController) {
    self.inputController = inputController
    self.outputController = outputController
  }
  
  func start() {
    
    while true {
      outputController.displayOpeningPhrase()
      var `continue` = true
      while `continue` {
        let input = inputController.read { if !$0 {exit(0)} }
        self.processInput(input) { isFinished in
          if isFinished {
            `continue` = false
          }
        }
      }
    }
  }
  
  private func processInput(_ userInput: String, completion: (Bool) -> Void) {
    outputController.proceedUserInput(on: userInput, completion: completion)
  }
    
}
