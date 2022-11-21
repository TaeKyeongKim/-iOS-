//
//  DefualtInputValidator.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/17.
//

import Foundation

//MARK: InputProcesser 는 사용자가 옵션을 선택한뒤의 입력값을 검사하는
struct DefualtInputProcesser: InputProcessable {
  
  //MARK: InputProcesser 에서 Input 은 "", 혹은 아무 문자나 들어올수있기에,
  //각 메뉴 옵션 마다 필요한 값을 찾아 
  func parseInput(val: String, currentMenu: MenuOption, completion: (Result<[String], InputErrors>) -> Void) {
    let userInput = val.components(separatedBy: " ")
    
    switch currentMenu {
      
    case .addStudent, .deleteStudent, .viewCredit:
      if userInput[0].isEmpty {
        completion(.failure(.inputMissMatch))
      }else {
        completion(.success(userInput))
      }
      
    case .editCredit:
      if userInput.count != 3 {
        completion(.failure(.inputMissMatch))
      }else {
        completion(.success(userInput))
      }
      
    case .deleteCredit:
      if userInput.count != 2 {
        completion(.failure(.inputMissMatch))
      }else {
        completion(.success(userInput))
      }
      
    default:
      break
    }

  }

}
