//
//  CreditRepository.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/19.
//

import Foundation

protocol CreditRepository {
  func fetchCredits() -> [Student:[Subject]]
  func saveCurrentList(data: [Student:[Subject]])  
}
