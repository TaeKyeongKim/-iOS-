//
//  Student.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/19.
//

import Foundation

struct Student: Hashable, Codable {
  var name: String
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(self.name)
  }
}


