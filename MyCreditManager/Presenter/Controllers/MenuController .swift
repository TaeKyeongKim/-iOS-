//
//  MenuDisplayable .swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/17.
//

import Foundation

//MARK: Manages control of menu execution and

final class MenuController {

  let defaultPhrase = "원하는 기능을 입력해 주세요."
  let menuView: [MenuDescribable]
  let printer: Printable
  let viewModel: MenuViewModel
  let inputProcesser: InputProcessable
  private(set) var selectedMenu: MenuOption? {
    didSet {
      guard let currentMenu = selectedMenu else {
        return
      }
      display(combineSelectedMenuInstruction(menu: currentMenu))
    }
  }
  
  var openingPhrase: String {
    return combineMenuTitles()
  }
    
  var errorMessage: InputErrors? {
    didSet{
      guard let errorMessage = errorMessage else {
        return
      }
      display(errorMessage.description)
    }
  }

  init (menuView: [MenuDescribable],
        printer: Printable,
        viewModel: MenuViewModel,
        inputProcesser: InputProcessable) {
    self.menuView = menuView
    self.printer = printer
    self.inputProcesser = inputProcesser
    self.viewModel = viewModel
    
  }
  
  private func combineMenuTitles() -> String {
    var openingPhrase = ""
    for i in 0..<menuView.count {
      openingPhrase += "\(menuView[i].menuOption.rawValue): \(menuView[i].title), "
    }
    openingPhrase += MenuOption.exit.title
    return "\n\(defaultPhrase)\n\(openingPhrase)"
  }

  private func combineSelectedMenuInstruction(menu: MenuOption) -> String {
    return "\n\(menu.title)\n\(menu.description)"
  }
  
  
  //MARK: 사용자가 메뉴 번호를 입력했을때, 등록되어있는 메뉴 번호에 해당하는지 확인해주는 로직.
  private func processMenuSelection(on input: String, completion: (Bool) -> Void) {
    if let menuView = menuView.first(where: { $0.menuOption.rawValue == input }) {
      self.selectedMenu = menuView.menuOption
    }else {
      self.errorMessage = .menuInputError
      completion(true)
    }
  }
  
  //MARK: 사용자가 메뉴 번호를 입력한뒤의 input 을 실행하는 로직.
  private func proceedRequest(on input: String, currentMenu: MenuOption, completion: (Bool) -> Void) {
    inputProcesser.parseInput(val: input, currentMenu: currentMenu) { result in
      switch result {
      case .success(let parsedInput):
        viewModel.proceed(on: currentMenu, parsedInput: parsedInput) { message in
          display(message)
        }
        completion(true)
      case .failure(let error):
        self.errorMessage = error
        completion(true)
      }
    }
    selectedMenu = nil
  }
  
}


extension MenuController {
  
  func display(_ val: String) {
    printer.display(val)
  }
  
  func displayOpeningPhrase() {
    display(openingPhrase)
  }
  
  func proceedUserInput(on input: String, completion: (Bool) -> Void) {
    if let currentMenu = selectedMenu {
      proceedRequest(on: input, currentMenu: currentMenu, completion: completion)
    }else {
      processMenuSelection(on: input, completion: completion)
    }
  }

}

