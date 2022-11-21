//
//  AddStudent.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/19.
//

import Foundation

final class AddStudentView: MenuDescribable {
  
  var menuOption: MenuOption
  lazy var title: String = {
    return menuOption.title
  }()
  lazy var description: String = {
    return menuOption.description
  }()

  init(option: MenuOption = .addStudent) {
    self.menuOption = option
  }
  
}
