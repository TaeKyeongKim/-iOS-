//
//  ViewCredit.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/18.
//

import Foundation

final class ViewCreditView: MenuDescribable {
  
  var menuOption: MenuOption
  lazy var title: String = {
    return menuOption.title
  }()
  lazy var description: String = {
    return menuOption.description
  }()
  
  init(option: MenuOption = .viewCredit) {
    self.menuOption = option
  }

}
