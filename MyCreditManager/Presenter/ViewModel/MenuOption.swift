//
//  InputOptions.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/18.
//

import Foundation

//- 학생추가
//- 학생삭제
//- 성적추가(변경)
//- 성적삭제
//- 평점보기
//- 종료

enum MenuOption: String {
  case exit = "X"
  case addStudent = "1"
  case deleteStudent = "2"
  case editCredit = "3"
  case deleteCredit = "4"
  case viewCredit = "5"
  
  var title: String {
    switch self {
    case .addStudent:
      return "학생추가"
    case .deleteStudent:
      return "학생삭제"
    case .editCredit:
      return "성적추가"
    case .deleteCredit:
      return "성적삭제"
    case .viewCredit:
      return "평점보기"
    case .exit:
      return "X: 종료"
    }
  }
  
  
  var description: String {
    switch self {
    case .addStudent:
      return "추가할 학생의 이름을 입력하세요."
    case .deleteStudent:
      return "삭제할 학생의 이름을 입력하세요."
    case .editCredit:
      return "성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등) 을 띄어쓰기로 구분하여 차례로 작성해주세요 \n 입력예) Mickey Swift A+ \n 만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다."
    case .deleteCredit:
      return "성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례대로 작성해주세요."
    case .viewCredit:
      return "평점을 알고싶은 학생의 이름을 입력해주세요."
    case .exit:
      return " "
    }
  }
  
}
