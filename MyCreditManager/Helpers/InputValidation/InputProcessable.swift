//
//  InputParserable.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/17.
//

import Foundation

protocol InputProcessable {
  func parseInput(val: String, currentMenu: MenuOption, completion: (Result<[String], InputErrors>) -> Void)
}




