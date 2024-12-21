# Flutter Clean Architecture & SOLID Principles 🚀🚀🚀

A comprehensive guide to building scalable and maintainable Flutter applications using **Clean Architecture** and **SOLID Principles**.

---

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
│   │   ├── helper/
│   │   │   ├── auth_guard.dart
│   │   │   └── sliding_auto_route.dart
│   │   ├── routes.dart
│   │   └── routes.gr.dart
│   ├── theme/
│   │   ├── theme_data.dart
│   │   └── themes.dart
│
├── core/
│   ├── constants/
│   │   ├── api_endpoint.dart
│   │   ├── app_color.dart
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
│   │   │   ├── data_error_type.dart
│   │   │   ├── data_state.dart
│   │   │   ├── failure_state.dart
│   │   │   ├── loading_state.dart
│   │   │   └── success_state.dart
│   ├── services/
│   │   ├── dio/
│   │   │   ├── authentication_interception.dart
│   │   │   ├── dio_client_dev.dart
│   │   │   ├── dio_client_prod.dart
│   │   │   ├── dio_client.dart
│   │   │   └── dio_multipart_client.dart
│   │   ├── image_picker/
│   │   │   └── image_picker_service.dart
│   │   ├── message/
│   │   │   └── toast_message_service.dart
│   │   ├── navigation/
│   │   │   ├── navigation_data.dart
│   │   │   └── navigation_service.dart
│   │   ├── internet_service.dart
│   │   ├── local_database_service.dart
│   │   ├── isar_database_service.dart
│   │   └── user_data_service.dart
│   ├── utils/
│   │   ├── base_cubit/
│   │   │   ├── base_cubit_service_mixin.dart
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
│   │   ├── type_defs.dart
│   │   ├── ui_helper.dart
│   │   └── validator.dart
│
├── feature/
│   ├── app/
│   │   ├── data/
│   │   │   └── models/
│   │   ├── domain/
│   │   │   └── entities/
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
├── app_configuration.dart
├── application.dart
├── main_dev.dart
├── main_prod.dart
├── main_stg.dart
└── service_initializer.dart
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

3. **Generate a new feature using the `clean_cubit_feature` brick**:
   ```bash
   mason make clean_cubit_feature -c config.json
   ```

### What Does `clean_cubit_feature` Do?

The `clean_cubit_feature` brick generates a feature template following the **Clean Architecture** structure, including:

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
