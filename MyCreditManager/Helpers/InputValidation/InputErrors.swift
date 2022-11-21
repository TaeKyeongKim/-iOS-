//
//  InputErrors.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/17.
//

import Foundation


enum InputErrors: Error {
  case menuInputError
  case inputMissMatch
  
  var description: String {
    switch self {
    case .menuInputError:
      return "뭔가 입력이 잘못되었습니다. 올바른 메뉴 번호 혹은 X 를 입력하세요."
    case .inputMissMatch:
      return "입력이 잘못되었습니다. 다시 확인해 주세요."
    }
  }
}
