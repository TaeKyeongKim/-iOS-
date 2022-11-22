//
//  MenuViewModel.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/19.
//

import Foundation

final class MenuViewModel {
  
  var creditList: [Student: [Subject]] = [:]
  
  var saveCurrentCreditUsecase: SaveCurrentCredit
  var fetchCreditUsecase: FetchCredit
  
  init(saveCurrentCreditUsecase: SaveCurrentCredit,
       viewCreditUsecase: FetchCredit) {
    self.saveCurrentCreditUsecase = saveCurrentCreditUsecase
    self.fetchCreditUsecase = viewCreditUsecase
  }
  
  private func fetchStudentList() {
    creditList = fetchCreditUsecase.execute()
  }
  
  private func getStudentDictionaryElement(on name: String) -> Dictionary<Student, [Subject]>.Element? {
    if let student = creditList.first(where: {$0.key.name == name}){
      return student
    }
    return nil
  }
}

//MARK: Menu Operations
extension MenuViewModel {
  
  //MARK: AddStudent
  private func addStudent(name: String) -> String {
    guard getStudentDictionaryElement(on: name) == nil else {
      return "\(name) 는 이미 존재하는 학생입니다. 추가하지 않습니다."
    }
    creditList.updateValue([], forKey: Student(name: name))
    return "\(name) 학생을 추가했습니다."
  }
  
  //MARK: Delete Student
  private func deleteStudent(name: String) -> String {
    guard let dictVal = getStudentDictionaryElement(on: name),
          let index = creditList.index(forKey: dictVal.key)
    else {
      return "\(name) 학생을 찾지 못했습니다."
    }
    creditList.remove(at: index)
    return "\(name) 학생을 삭제 했습니다."
  }
  
  //MARK: Edit Credit
  private func editCredit(name: String, subject: String, grade: String) -> String {
    
    guard let inputGrade = Grade(rawValue: grade) else {
      return "\(grade) 는 존재하지 않은 점수 입니다."
    }
    
    guard let dictVal = getStudentDictionaryElement(on: name)
    else {
      return "\(name) 이라는 학생은 찾을수 없습니다."
    }

    if let index = creditList[dictVal.key]?.firstIndex(where: {$0.title == subject}) {
     creditList[dictVal.key]?[index].amendGradeTo(val: inputGrade)
    }else {
      let newSubject = Subject(title: subject, grade: inputGrade)
      creditList[dictVal.key]?.append(newSubject)
    }
    
    return "\(name) 학생의 \(subject) 과목이 \(inputGrade.rawValue)로 추가(변경) 되었습니다."
  }
  
  //MARK: Delete Credit
  private func deleteCredit(name: String, subject: String) -> String {
    guard let dictVal = getStudentDictionaryElement(on: name)
    else {
      return "\(name) 이라는 학생은 찾을수 없습니다."
    }

    if let index = creditList[dictVal.key]?.firstIndex(where: {$0.title == subject}) {
      creditList[dictVal.key]?.remove(at: index)
      return "\(name) 학생의 \(subject) 과목의 성적이 삭제 되었습니다."
    }
    
    return "\(name) 학생의 \(subject) 과목의 성적을 찾을수 없습니다."
  }
  
  //MARK: View Credit
  private func viewCredit(name: String) -> String {
    var credits = ""
    var creditPoints = 0.0
    
    guard let dictVal = getStudentDictionaryElement(on: name),
            let subjects = creditList[dictVal.key] else {
      return "\(name) 이라는 학생은 찾을수 없습니다."
    }
    
    for subject in subjects {
      credits += "\(subject.title): \(subject.grade.rawValue)\n"
      creditPoints += subject.grade.value
    }
    
    credits += "평점: \(String(format: "%.2f", creditPoints / Double(subjects.count)))"
    return credits
  }

}

extension MenuViewModel {
  
  //Switch case 문을 사용하기에 completion 을 써서 return value 가 없도록 구현
  func proceed(on menuOption: MenuOption, parsedInput: [String], completion: ((_ message: String) -> Void)) {
    
    //MARK: Prior to process of a Menu, the list gets updated first.
    fetchStudentList()

    switch menuOption {
    case .addStudent:
      completion(addStudent(name: parsedInput[0]))
    case .deleteStudent:
      completion(deleteStudent(name: parsedInput[0]))
    case .editCredit:
      completion(editCredit(name: parsedInput[0], subject: parsedInput[1].uppercased(), grade: parsedInput[2]))
    case .deleteCredit:
      completion(deleteCredit(name: parsedInput[0], subject: parsedInput[1].uppercased()))
    case .viewCredit:
      completion(viewCredit(name: parsedInput[0]))
    case .exit:
      break
    }
    
    //MARK: Save Changes into cache
    saveCurrentCreditUsecase.execute(data: creditList)
  }

}

