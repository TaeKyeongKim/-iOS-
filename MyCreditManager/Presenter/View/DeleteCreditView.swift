//
//  DeleteCredit.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/18.
//

import Foundation

final class DeleteCreditView: MenuDescribable {
  
  var menuOption: MenuOption
  lazy var title: String = {
    return menuOption.title
  }()
  lazy var description: String = {
    return menuOption.description
  }()
  
  init(option: MenuOption = .deleteCredit) {
    self.menuOption = option
  }

}
