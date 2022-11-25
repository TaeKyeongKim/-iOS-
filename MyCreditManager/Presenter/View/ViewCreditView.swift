//
//  ViewCredit.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/18.
//

import Foundation

struct ViewCreditView: MenuDescribable {
  
  var menuOption: MenuOption
  var title: String {
    return menuOption.title
  }
  
  var description: String {
    return menuOption.description
  }
  
  init(option: MenuOption = .viewCredit) {
    self.menuOption = option
  }

}
