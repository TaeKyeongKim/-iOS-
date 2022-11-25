//
//  AddStudent.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/19.
//

import Foundation

struct AddStudentView: MenuDescribable {
  
  var menuOption: MenuOption
   var title: String {
    return menuOption.title
  }
   var description: String  {
    return menuOption.description
  }

  init(option: MenuOption = .addStudent) {
    self.menuOption = option
  }
  
}
