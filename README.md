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

### **Config**
- **Routes**
  - ✅ **Helper**
    - `Auth Guard`
    - `Page Transition`
- **Theme**
  - ✅ `Theme Data`
  - ✅ `Themes`

---

### **Core**
- **Constants**
  - ✅ `Api Endpoint`
  - ✅ `App Color`
  - ✅ `App Icons`
- **Data**
  - ✅ **API**
    - `Api Response`
    - `Refresh Token Request`
    - `Refresh Token Response`
  - ✅ **Errors**
    - `Data Handler`
    - `Error Handler`
    - `Error Types`
  - ✅ **States**
    - `Data Error Type`
    - `Data State`
    - `Failure State`
    - `Loading State`
    - `Success State`
- **Services**
  - ✅ **Dio**
    - `Dio Client`
    - `Dio Interception`
    - `Dio MultiPartClient`
  - ✅ **Image Picker**
    - `Image Picker Service`
  - ✅ **Message**
    - `Toast Message Service`
  - ✅ **Navigation**
    - `Navigation Data`
    - `Navigation Service`
  - ✅ `Internet Service`
  - ✅ `Local Database Service`
  - ✅ `Isar Database Service`
  - ✅ `User Data Service`
- **Utils**
  - ✅ **Base Cubit**
    - `Base Cubit Service Mixin`
    - `Base Cubit`
  - ✅ **Extensions**
    - `BuildContext Extension`
    - `String Extension`
    - `Num Extension`
    - `.....`
  - ✅ **Screen Util**
    - `Screen Type`
    - `Screen Util`
  - ✅ **UseCase**
    - `User Case`
  - ✅ `Debounce Time`
  - ✅ `Type Definitions`
  - ✅ `UI Helper`
  - ✅ `Validator`

---

### **Feature**
- **App**
  - `.....`
- **Auth**
  - ✅ **Data**
    - `Models`
    - `DataSources`
    - `Repository Implementations`
  - ✅ **Domain**
    - `Entities`
    - `Repositories`
    - `UseCases`
  - ✅ **Presentation**
    - `Cubits`
    - **Pages**
      - `Widgets`
    - `Widgets`
- **Dashboard**
  - `.....`

---

### **Injector**
- ✅ **Injections**
  - `Bloc Injections`
  - `.....`
- ✅ `Injector Dev`
- ✅ `Injector Prod`
- ✅ `Injector Stg`
- ✅ `Injector`

---

### **Other Components**
- ✅ `App Config`
- ✅ `Application`
- ✅ `Main Dev`
- ✅ `Main Prod`
- ✅ `Main Stg`
- ✅ `Service Initializer`

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
