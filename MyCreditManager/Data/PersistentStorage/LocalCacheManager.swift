//
//  LocalStorageManager.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/21.
//

import Foundation

protocol CacheManagable {
  func fetchSavedData() -> [Student: [Subject]]
  func save(data: [Student: [Subject]])
}

final class LocalCacheManager: CacheManagable {

  private var defaultLocalURL = FileManager.documentURL.appendingPathComponent("Credits").appendingPathExtension("json")
  private let encoder = JSONEncoder()
  private let decoder = JSONDecoder()

  func fetchSavedData() -> [Student : [Subject]] {
    do {
      let savedData = try (Data(contentsOf: defaultLocalURL))
      let parsedData = try decoder.decode([Student:[Subject]].self, from: savedData)
      return parsedData
    } catch let error {
      print(error)
    }
    return [:]
  }
  
  func save(data: [Student: [Subject]]) {
    do {
      let jsonData = try encoder.encode(data)
      try jsonData.write(to: defaultLocalURL)
    } catch {
      print(error)
    }
  }
  
  
}


extension FileManager {
 static var documentURL: URL {
   return `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
  }
}
