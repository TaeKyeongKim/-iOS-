//
//  DefualtCreditRepository.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/21.
//

import Foundation

final class DefualtCreditRepository: CreditRepository {

  private var creditStorage: CacheManagable

  init(creditStorage: CacheManagable) {
    self.creditStorage = creditStorage
  }
  
  func fetchCredits() -> [Student : [Subject]] {
    return creditStorage.fetchSavedData()
  }
  
  func saveCurrentList(data: [Student:[Subject]]) {
    creditStorage.save(data: data)
  }
  
}
