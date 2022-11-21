## MyCreditManager [원티드 프리온보딩 챌린지 iOS과정 사전과제]

## 요구사항 
- [사전과제 링크](https://yagomacademy.notion.site/iOS-ba2d0c0bb0b949c896cc28567706e969) 를 통해 자세한 요구사항을 확인 하실수 있습니다. 

## 이루고자 했던 목표
- 1.0 `Clean Architecture` 를 적용하여 Presentation, Data Layer 가 바뀌어도 설계한 Domain Layer 을 가지고 어떤 플렛폼이든 적용가능한 코드를 작성하는것. 
- 2.0 `Input` 과 `Output` 모듈로 나누어 프로젝트 설계 하여 모듈간의 `단일책임 원칙` 을 지키는것. 
- 3.0 사용자가 선택할수 있는 Menu 의 종류, 개수를 손쉽게 수정할수 있게 설계하는것. 
- 4.0 모든 모듈의 생성을 관리하는 `DIContainer` 설계하기 
- 5.0 프로그램의 흐름을 관리하는 `FlowCoordinator` 설계하기
- 6.0 Unit Test 의 고민과 적용 (진행중) 

## 1.0 Architecture 

- `Clean Architecture` 는 Presentation, Domain, Data, 3가지 Layer 로 구성되었습니다.
해당 아키텍처는 Clean Architecture 의 개념을 적용하였고, DDD(Domain Driven Design) 방식으로 진행 되었습니다.
![image](https://user-images.githubusercontent.com/36659877/203152434-60613fba-bfd9-4333-ade9-268b17d0b690.png)

## [역할과 책임] 

### Presentation Layer (MVVM 적용)
> [View & Controller]
- 화면상에 데이터를 보여주는 모듈들이 있는 Layer 입니다. 
- 사용자의 입력과, 출력이 이루어 지는곳 입니다.
- 현 과제에선 View 가 Console 에 해당하지만, `모든 메뉴를 보여주는 화면` 과, 각 `메뉴내에 있는 설명들을 표시해줄 화면` 들이 있다고 생각했고, presentation Layer 를 설계했습니다. 
 
> [ViewModel]
- 필요한 데이터를 가공 및 받아와 View 에 전달합니다.
- View 에 보여지는 데이터의 생성 및 가공은 모두 ViewModel 에서 처리됩니다.
- 각 메뉴에 맞는 로직을 내부에서 계산한뒤, Usecase 를 이용하여 데이터를 관리합니다. 

### Domain Layer 

- Domain Layer 는 해당 프로그램의 핵심 로직을 포함하고 있습니다. Presentation, Data Layer 는 Domain Layer 를 의존하고 있어 Domain 에서 변경이 생길시 다른 레이어도 바뀐 로직에 따른 수정이 요구 됩니다. (반대로 Presentation, Data Layer 가 바뀌어도 Domain Layer 의 로직에는 수정이 필요하지 않습니다) 

> [Model]
- 프로그램 에 사용되는 핵심 정보들을 그룹화시켜 모델로 정의합니다. 
- 해당 프로그램은 `Studnet`, `Subject` 라는 모델을 가지고 있습니다.

> [Usecase]
- 시스템의 동작을 사용자의 입장에서 표현한 시나리오이며, 시스템에 관련한 요구사항을 알아내는 과정입니다.
- 사용자가 이루려고하는 행동 하나하나를 인터페이스화 시켰고, 이를 통해 Usecase 만 보아도 어떤 기능을 하는 프로그램인지 파악할수 있도록 구성하였습니다. 
  - 원래 계획은 메뉴에 맞는 Usecase 를 설계하여 usecase 내부에서 모든 계산이 이루워 지도록 설계하려고 했지만, 현재 Usecase 는 Cache 된 데이터를 불러오는것과 저장하는 Usecase 로 설계 되었습니다. 이것에대한 더 자세한 고민은 아래 `고민과 해결` 을 참고해주세요


> [Repository] (Interfaces) 
- 각 Usecase 에서 필요한 데이터를 Network Service 혹은 Persistent Storage 에서 가져오는 역할을 합니다. 
- 현재 과제는 NetworkService 가 필요하지 않기 때문에 `Persistent Storage` 만 구현해 학생들의 과목 점수를 disk cache 해주도록 인터페이스를 구현했습니다.
- Domain Layer 에서는 Reopository 의 인터페이스만 구성하고 구현체는 DataLayer 에서 구성됩니다. 따라서 Usecase 에서 Repository 는 dependency inversion 에 의해 data Layer 가 domain Layer 에 의존 하게 됩니다.

### Data Layer 

> [Repository] (Implementation)
- 각 Usecase 에서 필요한 데이터를 Network Service 혹은 Persistent Storage 에서 가져오는 역할을 합니다. 

> [Persistent Storage] 
- 학생들의 과목 점수를 disk 에 저장 하고, 저장된 정보들을 가져오는 로직을 가지고 있습니다. 
- 현재 프로젝트에선 `FillManager` 로 data persistent 를 관리해주고 있습니다.

----

## 2.0 Input 과 Output 모듈 설계 


- 해당 프로그램은 Console 베이스로 실행되는 프로그램 이기에 Input 과 Output 모듈이 뚜렷히 나뉠수 있다고 생각했습니다.
- 아래 다이어그램은 input 과 output 을 담당하는 모듈과 전체적인 흐름을 나타냅니다.

> 설계  
![image](https://user-images.githubusercontent.com/36659877/203152525-9ac58435-f1ee-4a9e-abd5-9536ed06c352.png)

- 1.0 사용자의 Input 을 `InputController` 내부의 `InputReader` 를 사용하여 읽습니다. 이때 `InputReader` 는 사용자의 인풋이 `X: 종료` 인지 확인하고 만약 맞다면 프로그램을 `InputController` 에서부터 종료 시킵니다. 

- 2.0 사용자의 Input 이 `X: 종료` 가 아니면 `OutPut` 을 담당하는 모듈, `MenuController` 로 이동 하게됩니다. `MenuController` 는 들어온 사용자 인풋이 메뉴에 해당하는지, 만약 해당한다면 그 다음동작을 처리합니다. 

- 3.0 `MenuController` 내부에 있는 `Printer` 는 사용자 Input 이 처리되가는 과정을 `Console` 로 표시하게 됩니다.  


## 3.0 사용자가 선택할수 있는 Menu 의 종류, 개수를 손쉽게 수정할수 있게 설계하기.

- 현재 프로젝트요구사항은 사용자가 선택할수 있는 메뉴의 개수가 6 개로 정해져있지만 이 갯수가 더 늘어나거나 줄어들어도 손쉽게 수정할수 있도록 설계 해보고 싶었습니다. 

> 설계 
- 각 메뉴는 제목 `Title`, 선택했을때 보여지는 설명 `Desciption`,  메뉴 번호 `menuOption (숫자)` 로 구성됩니다. 
- 앞서 설명했듯이 각 메뉴 들은 `View` 에 해당하기 때문에 공통되는 요소들을 하나의 프로토콜 `MenuDescribable` 로 묶어 편하게 생성할수 있도록 구현해주었습니다. 
- 따라서 만일 추가되는 뷰가 생긴다면, `MenuDescribable` 을 채택한 새로운 뷰를 생성하고, `menuOption` 의 case 를 더해준다면 간편하게 수정이 가능하게됩니다.
![image](https://user-images.githubusercontent.com/36659877/203156832-994e8db7-2c14-41bd-95f4-13d3d4cea3a0.png)


## 4.0 모든 모듈의 생성을 관리하는 `DIContainer` 설계하기 
- 프로그램에서 사용되는 모듈들이 생성되는 역할 을 한군데에 몰아서 관리된다면 기능추가, 삭제시 유지보수가 쉽게 진행될수 있다고 생각해서 `DIContainer` 를 설계했습니다. 
- 현 프로그램의 DIContainer 이 제시하는 `key` 는 `Input`, `Output` 을 관리하는 가장 핵심 묘듈 `InputController` 와 `MenuController` 을 생성하는것입니다. 
- 따라서 `InputController` 과 `MenuController` 를 생성하기 위해서 필요한 요소들의 initalization 메소드를 전부 포함하고 있습니다. 

## 5.0 프로그램의 흐름을 관리하는 `FlowCoordinator` 설계하기
- `DIContainer` 는 프로그램의 흐름을 관리하는 `FlowCoordinator` 또한 생성해주는데, 이는 사용자가 와 프로그램의 사이의 흐름을 관리해주기 위해 사용됩니다. 
- `start` 라는 함수내에 흐름을 제어하는 코드를 작성하여 프로그램의 흐름을 관리할수 있습니다. 

## 6.0 Unit Test 의 고민과 적용 (진행중) 


## 고민과 해결 (진행중) 

<details> 
  <summary> Input, Output 모듈로 나누어 프로젝트 설계하기 </summary> 

</details>

<details> 
  <summary> Usecase 바로잡기 </summary> 

</details>
