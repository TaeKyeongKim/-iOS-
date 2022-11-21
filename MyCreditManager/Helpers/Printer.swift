//
//  Printer.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/18.
//

import Foundation

//MARK: 콘솔에 찍히는 모든 String 값은 Printer 를 통해서 보여진다.
protocol Printable {
  func display(_ val: String)
}

struct Printer: Printable {
   func display(_ val: String) {
    print(val)
  }
}
