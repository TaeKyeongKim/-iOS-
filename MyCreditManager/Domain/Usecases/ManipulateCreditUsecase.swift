//
//  AddStudent.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/18.
//

import Foundation


//MARK: ManipulateCredit 은 아래의 기능이 ViewModel 에서 수행된이후, cache 된 데이터를 업데이트 해주는 역할을 합니다.
//- 학생추가
//- 학생삭제
//- 성적추가(변경)
//- 성적삭제

protocol SaveCurrentCredit {
  func execute(data: [Student:[Subject]])
}


final class SaveCurrentCreditUsecase: SaveCurrentCredit {
  
  private let repository: CreditRepository
  
  init(repository: CreditRepository) {
    self.repository = repository
  }
  
  func execute(data: [Student:[Subject]]) {
    repository.saveCurrentList(data: data)
  }

}
