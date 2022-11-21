//
//  ViewCreditUsecase.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/21.
//

import Foundation

//MARK: ViewCredit 저장되어 있는 데이터를 모두 불러오는 Usecase 입니다.

protocol FetchCredit {
  func execute() -> [Student:[Subject]]
}

final class FetchCreditUsecase: FetchCredit {
  
  private let repository: CreditRepository
  
  init(repository: CreditRepository) {
    self.repository = repository
  }
  
  func execute() -> [Student:[Subject]] {
    return repository.fetchCredits()
  }

}
