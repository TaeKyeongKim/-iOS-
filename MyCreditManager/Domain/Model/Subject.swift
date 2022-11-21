//
//  Subject.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/19.
//

import Foundation

struct Subject: Hashable, Codable {
  var title: String
  var grade: Grade
  
  init(title: String, grade: Grade) {
    self.title = title.uppercased()
    self.grade = grade
  }
  
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(self.title)
  }
  
  mutating func amendGradeTo(val newGrade: Grade) {
    self.grade = newGrade
  }
  
}
