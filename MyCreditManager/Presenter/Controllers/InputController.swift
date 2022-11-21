//
//  InputController.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/18.
//

import Foundation

final class InputController {
  
  let inputReader: InputReadable

  init(inputReader: InputReadable) {
    self.inputReader = inputReader
  }

  func read() -> String {
    return readUserInput()
  }

  private func readUserInput() -> String {
    let userInput = inputReader.read { if $0 {exit(0)} }
    return userInput
  }
  
}
