//
//  Credit.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/19.
//

import Foundation

//- A+ (4.5점) / A (4점)
//- B+ (3.5점) / B (3점)
//- C+ (2.5점) / C (2점)
//- D+ (1.5점) / D (1점)
//- F (0점)

enum Grade: String, Codable {
  case APlus = "A+"
  case A
  case BPlus = "B+"
  case B
  case CPlus = "C+"
  case C
  case DPlus = "D+"
  case D
  case F
  
  var value: Double {
    switch self {
    case .APlus:
      return 4.5
    case .A:
      return 4
    case .BPlus:
      return 3.5
    case .B:
      return 3
    case .CPlus:
      return 2.5
    case .C:
      return 2
    case .DPlus:
      return 1.5
    case .D:
      return 1
    case .F:
      return 0
    }
  }
  
}
