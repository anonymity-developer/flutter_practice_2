# Feature-based 구조 가이드

## 📁 레이어별 역할과 포함 내용

### 🎯 Domain Layer (비즈니스 로직 레이어)
**역할**: 순수한 비즈니스 로직과 규칙을 정의하는 레이어
- **외부 의존성 없음** (Flutter, HTTP, DB 등 플랫폼 의존성 없음)
- **순수 Dart 클래스**만 사용
- 다른 레이어에 의존하지 않음 (가장 안쪽 레이어)

#### 포함 내용:
```
domain/
├── entities/          # 도메인 엔티티 (비즈니스 객체)
│   └── user.dart      # - 순수한 비즈니스 모델
│                       # - 데이터베이스나 API 구조와 무관
│                       # - 비즈니스 규칙 포함
│
└── repositories/       # Repository 인터페이스 (계약)
    └── auth_repository.dart  # - 데이터 접근 방법을 정의하는 추상 클래스
                              # - 구현체는 Data 레이어에 있음 (의존성 역전)
                              # - UseCase나 BLoC에서 이 인터페이스를 사용
```

**예시**:
- `User` 엔티티: 사용자 정보를 나타내는 순수한 객체
- `AuthRepository` 인터페이스: "회원가입", "사용자 조회" 등의 메서드 정의

---

### 💾 Data Layer (데이터 처리 레이어)
**역할**: 실제 데이터 저장/조회를 담당하는 레이어
- **Domain 레이어에 의존** (Entity, Repository 인터페이스 사용)
- **외부 라이브러리 사용** (SharedPreferences, HTTP, SQLite 등)
- Domain의 Repository 인터페이스를 구현

#### 포함 내용:
```
data/
├── models/            # 데이터 모델 (JSON, DB 구조와 매핑)
│   └── user_model.dart  # - JSON 직렬화/역직렬화
│                        # - Entity와 Model 간 변환
│                        # - API 응답, DB 스키마와 매핑
│
├── datasources/       # 데이터 소스 (실제 저장/조회 구현)
│   └── auth_local_datasource.dart  # - SharedPreferences, Hive, SQLite 등
│                                    # - API 호출 (http 패키지)
│                                    # - 실제 데이터 저장/조회 로직
│
└── repositories/      # Repository 구현체
    └── auth_repository_impl.dart   # - Domain의 Repository 인터페이스 구현
                                    # - DataSource를 사용하여 데이터 처리
                                    # - Model을 Entity로 변환하여 반환
```

**예시**:
- `UserModel`: JSON 구조와 매핑되는 데이터 모델
- `AuthLocalDataSource`: SharedPreferences에 실제로 저장/조회
- `AuthRepositoryImpl`: Domain의 `AuthRepository` 인터페이스 구현

---

### 🎨 Presentation Layer (UI 레이어)
**역할**: 사용자 인터페이스와 상태 관리를 담당하는 레이어
- **Domain 레이어에 의존** (Entity, Repository 인터페이스 사용)
- **BLoC 패턴** 사용하여 상태 관리
- 사용자 입력을 Event로 변환하고, State를 UI에 반영

#### 포함 내용:
```
presentation/
├── bloc/              # BLoC (상태 관리)
│   ├── auth_event.dart    # - 사용자 액션을 나타내는 이벤트
│   │                      # - 예: SignUpRequested, LoadSavedUser
│   │
│   ├── auth_state.dart    # - UI 상태를 나타내는 상태
│   │                      # - 예: AuthLoading, AuthSuccess, AuthFailure
│   │
│   └── auth_bloc.dart    # - Event를 받아서 Repository 호출
│                         # - 처리 결과를 State로 변환
│                         # - UI에 상태 전달
│
└── pages/             # UI 화면
    └── sign_up_page.dart  # - 사용자 입력 폼
                          # - Event 발생 (BlocProvider.of(context).add(...))
                          # - State 구독 (BlocBuilder, BlocConsumer)
                          # - UI 업데이트
```

**예시**:
- `SignUpRequested` Event: 사용자가 회원가입 버튼 클릭
- `AuthBloc`: Repository를 호출하여 회원가입 처리
- `AuthSuccess` State: 회원가입 성공 시 UI에 표시
- `SignUpPage`: 실제 화면 UI

---

## 🔄 데이터 흐름

```
사용자 입력 (UI)
    ↓
Event 발생 (SignUpRequested)
    ↓
BLoC (AuthBloc)
    ↓
Repository 인터페이스 (AuthRepository)
    ↓
Repository 구현체 (AuthRepositoryImpl)
    ↓
DataSource (AuthLocalDataSource)
    ↓
실제 저장 (SharedPreferences)
    ↓
Model → Entity 변환
    ↓
State 업데이트 (AuthSuccess)
    ↓
UI 업데이트
```

## 📋 레이어별 규칙

### Domain 레이어
- ✅ 순수 Dart 클래스만 사용
- ✅ 다른 레이어에 의존하지 않음
- ✅ 비즈니스 로직과 규칙 정의
- ❌ Flutter, HTTP, DB 등 외부 라이브러리 사용 금지

### Data 레이어
- ✅ Domain의 Entity와 Repository 인터페이스 사용
- ✅ 외부 라이브러리 사용 가능 (SharedPreferences, HTTP 등)
- ✅ Model ↔ Entity 변환 담당
- ❌ Presentation 레이어에 의존하지 않음

### Presentation 레이어
- ✅ Domain의 Entity와 Repository 인터페이스 사용
- ✅ Flutter 위젯 사용
- ✅ BLoC을 통한 상태 관리
- ❌ Data 레이어의 구체적인 구현에 직접 의존하지 않음 (인터페이스만 사용)

## 🎯 의존성 방향

```
Presentation → Domain ← Data
```

- **Domain**: 가장 안쪽, 의존성 없음
- **Data**: Domain에 의존, Domain의 인터페이스 구현
- **Presentation**: Domain에 의존, Domain의 인터페이스 사용

이렇게 하면 **의존성 역전 원칙(DIP)**을 따르게 되어, 테스트와 유지보수가 쉬워집니다!

