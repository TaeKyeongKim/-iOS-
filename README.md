## MyCreditManager [원티드 프리온보딩 챌린지 iOS과정 사전과제]

## 요구사항 
- [사전과제 링크](https://yagomacademy.notion.site/iOS-ba2d0c0bb0b949c896cc28567706e969) 를 통해 자세한 요구사항을 확인 하실수 있습니다. 

## 이루고자 했던 목표
- 1.0 `Clean Architecture` 를 적용하여 Presentation, Data Layer 가 바뀌어도 설계한 Domain Layer 을 가지고 어떤 플렛폼이든 적용가능한 코드를 작성하는것. 
- 2.0 `Input` 과 `Output` 모듈로 나누어 프로젝트 설계 하여 모듈간의 `단일책임 원칙` 을 지키는것. 
- 3.0 사용자가 선택할수 있는 Menu 의 종류, 개수를 손쉽게 수정할수 있게 설계하는것. 

## Architecture 

- `Clean Architecture` 는 Presentation, Domain, Data, 3가지 Layer 로 구성되었습니다.
해당 아키텍처는 Clean Architecture 의 개념을 적용하였고, DDD(Domain Driven Design) 방식으로 진행 되었습니다.


![image](https://user-images.githubusercontent.com/36659877/203142777-e45bb0a2-9e20-46e2-90ee-6097b3777c29.png)

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

 

## Input 과 Output 모듈 설계 

> Input 

> Output



## DIContainer 

## FlowCoordinator 

## Helpers 
- Input Reader 
- Printer 
- InputValidator







## 고민과 해결 


<details> 
  <summary> Input, Output 모듈로 나누어 프로젝트 설계하기 </summary> 

</details>


<details> 
  <summary> Usecase 바로잡기 </summary> 

</details>











