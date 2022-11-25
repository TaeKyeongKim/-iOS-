//
//  InputReader .swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/18.
//

import Foundation

protocol InputReadable {
  func read(completion: (Bool) -> Void) -> String
}

struct InputReader: InputReadable {
  
  func read(completion: (Bool) -> Void) -> String {
    let input = readLine()!
    if let exit = MenuOption.init(rawValue: input.components(separatedBy: .whitespaces).joined().uppercased()),
       exit == .exit {
      completion(false)
    }
    return input
  }
  
}
