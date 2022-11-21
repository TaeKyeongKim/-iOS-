//
//  Menu.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/19.
//

import Foundation

protocol MenuDescribable {
  var title: String { get }
  var description: String { get }
  var menuOption: MenuOption { get }
}
