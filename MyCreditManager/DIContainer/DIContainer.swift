//
//  DIContainer.swift
//  MyCreditManager
//
//  Created by Kai Kim on 2022/11/18.
//

import Foundation

struct DIContainer {

  //MARK: Controllers
  func makeInputController() -> InputController {
    return InputController(inputReader: makeInputReader())
  }
  
  func makeOutputController() -> MenuController {
    return MenuController(menuView: makeMenuViews(),
                          printer: makePrinter(),
                          viewModel: makeViewModel(),
                          inputProcesser: makeInputProcesser())
  }
  
  //MARK: Views
  func makeMenuViews() -> [MenuDescribable] {
    return [AddStudentView(), DeleteStudentView(), EditCreditView(), DeleteCreditView(), ViewCreditView()]
  }

  
  //MARK: ViewModel
  func makeViewModel() -> MenuViewModel {
    return MenuViewModel(saveCurrentCreditUsecase: makeSaveCurrentCreditUsecase(), viewCreditUsecase: makeFetchCreditUsecase())
  }
  
  //MARK: Usecases
  func makeSaveCurrentCreditUsecase() -> SaveCurrentCredit {
    return SaveCurrentCreditUsecase(repository: makeCreditRepsitory())
  }

  func makeFetchCreditUsecase() -> FetchCredit {
    return FetchCreditUsecase(repository: makeCreditRepsitory())
  }
  
  
  //MARK: Repository
  func makeCreditRepsitory() -> CreditRepository {
    return DefualtCreditRepository(creditStorage: makePersistentManagable())
  }
  
  //MARK: Persistent Storage
  func makePersistentManagable() -> CacheManagable {
    return LocalCacheManager()
  }
  
  
  //MARK: Utilies
  func makeInputReader() -> InputReadable {
    return InputReader()
  }
  
  func makePrinter() -> Printable {
    return Printer()
  }
  
  func makeInputProcesser() -> InputProcessable {
    return DefualtInputProcesser()
  }
  
  //MARK: FlowCoordinator
  func makeFlowCoordinator() -> FlowCoordinator {
    FlowCoordinator(inputController: makeInputController(), outputController: makeOutputController())
  }
  
  
}


