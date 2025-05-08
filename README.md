# Flutter Clean Architecture & SOLID Principles 🚀🚀🚀

A comprehensive guide to building scalable and maintainable Flutter applications using **Clean Architecture** and **SOLID Principles**.

---

## Table of Contents 📌

- [Flutter Clean Architecture \& SOLID Principles 🚀🚀🚀](#flutter-clean-architecture--solid-principles-)
  - [Table of Contents 📌](#table-of-contents-)
  - [What is Clean Architecture? 🏗️](#what-is-clean-architecture-️)
    - [Core Layers of Clean Architecture:](#core-layers-of-clean-architecture)
    - [Benefits of Clean Architecture:](#benefits-of-clean-architecture)
  - [What are SOLID Principles? 💡](#what-are-solid-principles-)
  - [Getting Started 🛠️](#getting-started-️)
  - [Project Features ✨](#project-features-)
  - [Feature Template Generation Using Mason 🧱](#feature-template-generation-using-mason-)
    - [Steps to Generate a New Feature Template](#steps-to-generate-a-new-feature-template)
    - [What do `cubit_feature` \& `cubit_page` Do?](#what-do-cubit_feature--cubit_page-do)
    - [Configuration](#configuration)
  - [Visual Representation 📊](#visual-representation-)
  - [Why Clean Architecture \& SOLID Principles? 🧩](#why-clean-architecture--solid-principles-)
  - [Overview of API Workflow Layers 🧱](#overview-of-api-workflow-layers-)
    - [Data Flow Summary 🔁](#data-flow-summary-)
    - [Core Components 📦](#core-components-)
      - [1. `Repository`](#1-repository)
      - [2. `RemoteDataSource`](#2-remotedatasource)
      - [3. `DioClient`](#3-dioclient)
      - [4. `Interceptor`](#4-interceptor)
      - [5. `LocalDataSource`](#5-localdatasource)
      - [6. `DataHandler`](#6-datahandler)
      - [7. `ErrorHandler`](#7-errorhandler)
      - [8. `DataState<T>`](#8-datastatet)
    - [Example: Login Flow 🔄](#example-login-flow-)
      - [Internal Flow](#internal-flow)
    - [Benefits ✅](#benefits-)
    - [Debugging Tools 🔍](#debugging-tools-)
    - [Testing Tips 🧪](#testing-tips-)

## What is Clean Architecture? 🏗️

**Clean Architecture** is a software design philosophy that promotes separation of concerns through clearly defined layers. Each layer has a specific responsibility, making the codebase modular, testable, and easier to maintain.

### Core Layers of Clean Architecture:

1. **Presentation Layer**

   - Contains the UI and state management (e.g., Cubits, Widgets, Pages).
   - Responsible for displaying data and handling user interactions.

2. **Domain Layer**

   - The heart of the application. Contains **Entities**, **UseCases**, and **Repositories**.
   - Focuses purely on business logic, independent of frameworks.

3. **Data Layer**
   - Manages data sources (e.g., APIs, local databases).
   - Implements repositories to provide data to the domain layer.

### Benefits of Clean Architecture:

- Promotes **independence** from frameworks, UI, and external data sources.
- Ensures **modularity**, enabling easier testing and maintenance.
- Supports **scalability** and flexibility for future feature additions.

---

## What are SOLID Principles? 💡

**SOLID Principles** complement **Clean Architecture** by defining guidelines to write clean, maintainable, and extensible code. They are:

1. **S - Single Responsibility Principle (SRP)**  
   Each class should have only one responsibility or reason to change.

2. **O - Open/Closed Principle (OCP)**  
   Classes should be open for extension but closed for modification.

3. **L - Liskov Substitution Principle (LSP)**  
   Subtypes must be substitutable for their base types without altering the correctness of the program.

4. **I - Interface Segregation Principle (ISP)**  
   Classes should not be forced to implement interfaces they do not use.

5. **D - Dependency Inversion Principle (DIP)**  
   High-level modules should not depend on low-level modules; both should depend on abstractions.

---

## Getting Started 🛠️

```
lib/
│
├── config/
│   ├── routes/
│   │   ├── guards/
│   │   │   ├── authenticated_guard.dart
│   │   ├── helper/
│   │   │   ├── route_data.dart
│   │   │   └── sliding_auto_route.dart
│   │   ├── routes.dart
│   │   └── routes.gr.dart
│   ├── theme/
│   │   ├── theme_data.dart
│   │   └── themes.dart
│
├── core/
│   ├── constants/
│   │   ├── api_endpoints.dart
│   │   ├── app_colors.dart
│   │   └── app_icons.dart
│   ├── data/
│   │   ├── api/
│   │   │   ├── api_response.dart
│   │   │   ├── refresh_token_request.dart
│   │   │   └── refresh_token_response.dart
│   │   ├── errors/
│   │   │   ├── data_handler.dart
│   │   │   ├── error_handler.dart
│   │   │   └── error_types.dart
│   │   ├── states/
│   │   │   ├── data_state.dart
│   │   │   ├── failure_state.dart
│   │   │   ├── loading_state.dart
│   │   │   └── success_state.dart
│   ├── services/
│   │   ├── database/
│   │   │   └── isar_database_service.dart
│   │   │   └── local_database_service.dart
│   │   ├── api/
│   │   │   ├── auth_interception.dart
│   │   │   ├── api_service_dev.dart
│   │   │   ├── api_service_prod.dart
│   │   │   ├── api_service_stg.dart
│   │   │   ├── api_service.dart
│   │   │   └── multipart_service.dart
│   │   ├── image_picker/
│   │   │   └── image_picker_service.dart
│   │   ├── internet/
│   │   │   └── internet_service.dart
│   │   ├── message/
│   │   │   └── toast_message_service.dart
│   │   ├── navigation/
│   │   │   └── navigation_service.dart
│   │   ├── session/
│   │   │   └── session_manager.dart
│   ├── utils/
│   │   ├── base_cubit/
│   │   │   └── base_cubit.dart
│   │   ├── extensions/
│   │   │   ├── build_context_extension.dart
│   │   │   ├── double_extension.dart
│   │   │   ├── duration_extension.dart
│   │   │   ├── num_extension.dart
│   │   │   ├── page_controller_extension.dart
│   │   │   └── string_extension.dart
│   │   ├── screen_util/
│   │   │   ├── screen_type.dart
│   │   │   └── screen_util.dart
│   │   ├── use_case/
│   │   │   └── use_case.dart
│   │   ├── debounce_time.dart
│   │   ├── service_mixin.dart
│   │   ├── type_defs.dart
│   │   ├── ui_helpers.dart
│   │   └── validators.dart
│
├── feature/
│   ├── app/
│   │   └── presentation/
│   │       ├── base_widgets/
│   │       ├── widgets/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   ├── data_sources/
│   │   │   └── repository_implementations/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── use_cases/
│   │   └── presentation/
│   │       ├── cubits/
│   │       ├── pages/
│   │       └── widgets/
│   ├── dashboard/
│   │   └── ... (dashboard-specific files like auth feature)
│
├── injector/
│   ├── injector.config.dart
│   └── injector.dart
│
├── app_config.dart
├── app_initializer.dart
├── application.dart
├── main_dev.dart
├── main_prod.dart
├── main_stg.dart
```

---

## Project Features ✨

- 🛡️ **Use of SOLID Principles**: Ensuring scalable, maintainable, and testable code.
- 🏗️ **Clean Architecture**: Divides code into layers (Data, Domain, Presentation) for better separation of concerns.
- 🍴 **Build Flavors**: Seamless support for Development, Staging, and Production environments.
- 🔧 **Robust Error Handling**: Comprehensive API and internal error management mechanisms.
- 🔄 **Automated Request/Response Handling**: Including token refreshing and request inspection.
- 📡 **Core Services**:
  - Navigation, Internet, Local Database, Toast Messages, and User Credential management.
- 🎨 **Reusable UI Components**: Customizable themes and reusable widgets.
- ⚙️ **Utilities**:
  - Screen size handling, extensions, mixins, generics, and form validation utilities.

---

## Feature Template Generation Using Mason 🧱

This project uses **Mason** to generate feature templates for consistent and efficient development.

### Steps to Generate a New Feature Template

1. **Activate the `mason_cli` globally**:

   ```bash
   dart pub global activate mason_cli
   ```

2. **Fetch the bricks for the project**:

   ```bash
   mason get
   ```

3. **Generate a new feature using the `cubit_feature` brick**:

   ```bash
   mason make cubit_feature -c config.json
   ```

4. **Generate a new cubit and page using the `cubit_page` brick**:
   ```bash
   mason make cubit_page -c config.json
   ```

### What do `cubit_feature` & `cubit_page` Do?

The `cubit_feature` brick generates a feature template following the **Clean Architecture** structure, including:

- **Data Layer**:

  - Data Sources
  - Models
  - Repositories

- **Domain Layer**:

  - Entities
  - Repositories
  - Use cases

- **Presentation Layer**:

  - Cubits
  - Pages
  - Widgets

The `cubit_page` brick generates a cubit and a page templates inside the specified feature's presentation layer.

### Configuration

The generation process relies on a `config.json` file, which includes details such as feature, cubit, page names and entity name with it's variables type, name. Ensure that the `config.json` is correctly defined before running the generation command.

---

## Visual Representation 📊

![Clean Architecture With SOLID Principle](https://miro.medium.com/v2/resize:fit:720/format:webp/0*1w080Y72qaOdoC3W.png)

> This diagram highlights the modular and scalable structure of Clean Architecture, aligning with **SOLID principles** to ensure the best development practices.

---

## Why Clean Architecture & SOLID Principles? 🧩

- **Improves Code Readability**: Clear separation of layers and responsibilities makes it easier to understand.
- **Simplifies Maintenance**: Modular code allows isolated changes with minimal risk.
- **Promotes Scalability**: Adding new features becomes seamless with a structured foundation.
- **Enhances Testing**: Decoupled modules and layers are more straightforward to test.

**Start your journey toward building robust and scalable Flutter applications today! 🚀**

---

## Overview of API Workflow Layers 🧱

```mermaid
graph TD
    UI -->|calls| Cubit
    Cubit -->|calls| UseCase
    UseCase -->|calls| Repository
    Repository -->|calls| RemoteDataSource
    Repository -->|calls| LocalDataSource
    Repository -->|uses| InternetService
    Repository -->|wrapped by| DataHandler
    Repository -->|handles| DataState
    RemoteDataSource -->|uses| DioClient
    RemoteDataSource -->|wrapped by| DataHandler
    DioClient -->|sends| API
    LocalDataSource -->|uses| LocalDatabaseService
    LocalDataSource -->|wrapped by| ErrorHandler
    LocalDatabaseService -->|sends| LocalDB
```

---

### Data Flow Summary 🔁

1. **UI calls Cubit which calls UseCase**
2. **Cubit calls UseCase**
3. **UseCase calls Repository**
4. **Repository checks Internet availability** using `InternetService`
5. If online:
   - Calls `RemoteDataSource`
   - `RemoteDataSource` uses `DioClient` to make the HTTP request
   - Wraps response handling with `DataHandler.requestApi`
   - Errors are caught via `ErrorHandler`
6. If offline:
   - It can optionally fall back to `localCallback`
   - The `localCallback` uses `LocalDataSource`
7. **Repository sometimes also calls `LocalDataSource`** without depending on `InternetService`

All outcomes are returned as **DataState<T>**: `SuccessState`, or `FailureState`.

---

### Core Components 📦

#### 1. `Repository`

- Acts as the single source of truth for the domain layer.
- Decides when to fetch from remote or local.
- Uses `guardNetwork()` from `DataHandler` to handle connectivity gracefully.

#### 2. `RemoteDataSource`

- Contains remote API methods.
- Makes network calls via `DioClient`.

#### 3. `DioClient`

- Abstract layer over Dio.
- Simplifies request methods like `get`, `post`, `put`, `patch`, `delete`.
- Adds Alice debugger & interceptor.

#### 4. `Interceptor`

- Used in Dio to intercept and modify requests and responses.
- Automatically appends access tokens.
- Catches 401 responses and refreshes tokens before retrying failed requests.

#### 5. `LocalDataSource`

- Manages data locally using LocalDatabaseService
- Used for fallback or offline data storage

#### 6. `DataHandler`

- Wraps remote calls in `requestApi()`.
- Validates and parses API responses.
- Handles `SuccessState`, `FailureState`, and JSON parsing.

#### 7. `ErrorHandler`

- Catches various error types (`DioException`, `FormatException`, `TypeError`, etc.)
- Converts errors into `FailureState` with meaningful messages.

#### 8. `DataState<T>`

- Sealed class for representing UI state.
- Types:
  - `SuccessState<T>`
  - `FailureState<T>`
  - `LoadingState<T>`

```dart
state.when(
  success: (data) => print("Got data"),
  failure: (msg, type) => print("Error: $msg"),
  loading: () => print("Loading..."),
);
```

---

### Example: Login Flow 🔄

```dart

@injectable
class LoginCubit extends BaseCubit<LoginState> {
  final LoginCubitUseCases _useCases;

  LoginCubit({
    required LoginCubitUseCases useCases,
  })  : _useCases = useCases,
        super(const LoginState.initial());

  login({required String username, required String password}) async {
    final dataState = await _useCases.login.call(
      LoginRequest(username: "", password: ""),
    );

    dataState.when(
      success: (user) => print("Login success"),
      failure: (msg, type) => print("Login failed: $msg"),
      loading: () => print("Logging in..."),
    );

    /// Or

    if (dataState.hasData) {
      saveUserData(dataState.data!);
    } else if (dataState.hasError) {
      // Do something else
    }
  }

  saveUserData(UserData userData) async {
   final dataState = await _useCases.saveUserData.call(userData);

   if (dataState.hasData) {
      // Do something
    } else if (dataState.hasError) {
      // Do something else
    }
  }
}
```

#### Internal Flow

```mermaid
graph TD
   A[UI] --> B[LoginCubit]
    B --> C[LoginUseCase]
    B --> D[SaveUserDataUseCase]
    C --> E[AuthRepository]
    D --> E[AuthRepository]

    %% Remote Data Flow
    E -->|check internet| F[InternetService]
    E -->|calls| G[AuthRemoteDataSource.login]
    G --> H[Request API via DioClient]
    H --> I[Handles API Response]
    I -->|success| J[SuccessState]
    I -->|failure| K[FailureState]

    %% Local Data Flow
    E -->|calls| L[AuthLocalDataSource.saveUserData]
    L --> M[Request LocalDB via LocalDatabaseService]
    M --> N[Handles LocalDB Response]
    N -->|success| O[SuccessState]
    N -->|failure| P[FailureState]
```

---

### Benefits ✅

- **Decoupled Layers**: Easier testing and maintenance.
- **Unified Error Handling**: All API and type errors are gracefully caught.
- **Clean Network Management**: Internet check, retries, and fallback handled centrally.
- **Consistent UI State**: Always returns `DataState` for safe rendering.

---

### Debugging Tools 🔍

- **Alice** integrated into `DioClient` for easy request/response inspection

---

### Testing Tips 🧪

- You can mock `DioClient`, `AuthRemoteDataSource`, and `AuthRepository` easily.
- Test each layer in isolation.
