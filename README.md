# 🍳 Flutter Recipe App

Flutter로 만드는 레시피 앱

### 1단계 - UI 컴포넌트 연습

- 버튼, 텍스트 필드, 탭 등 기본 위젯 연습
- [Figma 디자인 참고]https://www.figma.com/design/gSeg6yi2QMN0GajM3diTb2/Food-Recipe-App--Community-?node-id=1-3&p=f&t=JaubYXaj4EP0pehl-0

### 결과 화면

<img src = "./assets/screenshots/step1.png" width = "400" height="500">

### 2단계 - UI 컴포넌트 연습 2

- Container, Stack, StatefulWidget, AlertDialog 등 위젯 연습

### 결과 화면

| AlertDialog Widget   별점 0개          | AlertDialog Widget        별점 4개     | 버튼, 텍스트 필드, 탭 등 기본 위젯 연습                     |
|-------------------------------------|-------------------------------------|----------------------------------------------|
| ![](./assets/screenshots/rate0.png) | ![](./assets/screenshots/rate4.png) | ![2단계 UI 연습](./assets/screenshots/stack.png) |

### 3단계 - Splash Screen + SavedRecipesScreen 화면 제작

- SplashScreen을 직접제작
- 이전 단계에서 제작한 savedrecipes를 MVVM모델로 재 작성

### 결과 화면

| SplashScreen                                                                                                             | SavedRecipes Screen                                                                                                      | 
|--------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| <img src = "https://github.com/user-attachments/assets/cfa31bc9-fd6b-4bcd-b7bb-33041c82d9ef" width = "350" height="450"> | <img src = "https://github.com/user-attachments/assets/08a4c36a-e0ea-485f-a265-ae0541f6b466" width = "350" height="450"> |

### 4단계 - Search recipes 화면 제작

- Search recipes을 통한 원하는 keyword로 레시피 찾는 기능 구현
- UI 상태 홀더 패턴을 사용

### 결과 화면

| Search recipes 기본화면                                                                           | keyword 입력시                                                                               | 해당 레시피 없을 경우                                                                                  |
|-----------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------|
| ![nokeyword](https://github.com/user-attachments/assets/27ea2603-6a40-4d5e-a14f-e321b7c8968d) | ![japan](https://github.com/user-attachments/assets/88f1c162-bc0c-4116-b353-4b36642e103b) | ![noresults](https://github.com/user-attachments/assets/73bb74bc-4b98-43c2-a491-4e47b4f7b538) |

### 5단계 - GoRouter와 ShellRouter를 활용해 화면 이동

- SignIn, SignUp 페이지 UI제작
- SignIn 버튼 클릭시 MainScreen으로 이동
- MainScreen은 BottomNavigationBar와 각 탭에 해당되는 스크린들을 ShellRouter로 불러옴

### 결과 화면

| SignIn                                                                                     | SignUp                                                                                     |
|--------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| ![signin](https://github.com/user-attachments/assets/df375f70-06a7-439a-9ad5-3ca65999aa30) | ![signup](https://github.com/user-attachments/assets/59de10da-d301-4d2e-b653-0d372fa8b7f5) |

| MainHome                                                                                     | SavedRecipes                                                                                |
|----------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
 ![mainhome](https://github.com/user-attachments/assets/220c8f3f-8664-4f23-ae08-5241903d84f5) | ![savedre](https://github.com/user-attachments/assets/0e81ccf3-3069-4ada-be4f-b2f86982f9fc) |