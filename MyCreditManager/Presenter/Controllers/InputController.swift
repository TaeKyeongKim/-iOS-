//
//  InputController.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/18.
//

import Foundation

struct InputController {
  
  let inputReader: InputReadable

  init(inputReader: InputReadable) {
    self.inputReader = inputReader
  }

  func read(completion:(Bool) -> Void) -> String {
    return readUserInput(completion: completion)
  }

  private func readUserInput(completion: (Bool) -> Void) -> String {
    let userInput = inputReader.read { completion($0) }
    return userInput
  }
  
}
