# SOLID Principles

**SOLID** is an acronym for five design principles that help developers create more understandable, flexible, and maintainable software. When combined with Clean Architecture, they provide a robust foundation for building scalable applications.

---

### 1. Single Responsibility Principle (SRP)

> A class should have only one reason to change.

This means a class should be responsible for a single piece of functionality. If a class handles multiple concerns, a change in one might unintentionally break another.

**Real-World Scenario: User Management**

Instead of a single class managing everything related to a user, we can split responsibilities.

**❌ Bad Practice:**

```dart
class UserManager {
  void authenticateUser(String email, String password) {
    // Network call to authenticate
  }

  void fetchUserProfile(String userId) {
    // Network call to get profile
  }

  void saveUserToLocalDb(User user) {
    // Logic to cache user data
  }
}
```
This `UserManager` has three distinct responsibilities. A change in the authentication API could risk breaking the local database logic.

**✅ Good Practice:**

Separate each responsibility into its own class.

```dart
// Handles authentication logic
abstract class IAuthService {
  Future<User> authenticateUser(String email, String password);
}

// Handles user profile data
abstract class IProfileRepository {
  Future<Profile> fetchUserProfile(String userId);
}

// Handles local caching
abstract class IUserCache {
  Future<void> saveUser(User user);
}
```

---

### 2. Open/Closed Principle (OCP)

> Software entities (classes, modules, functions) should be open for extension but closed for modification.

You should be able to add new functionality without changing existing code. This is often achieved through abstractions (interfaces or abstract classes).

**Real-World Scenario: Payment Processing**

Imagine you need to process payments from different sources.

**❌ Bad Practice:**

```dart
class PaymentProcessor {
  void processPayment(double amount, String method) {
    if (method == 'credit_card') {
      // Process credit card payment
    } else if (method == 'paypal') {
      // Process PayPal payment
    }
    // Adding a new payment method requires modifying this class
  }
}
```

**✅ Good Practice:**

Use an abstraction to allow for new payment methods to be added easily.

```dart
// The abstraction
abstract class PaymentMethod {
  void process(double amount);
}

// Concrete implementations
class CreditCardPayment extends PaymentMethod {
  @override
  void process(double amount) { /* ... */ }
}

class PayPalPayment extends PaymentMethod {
  @override
  void process(double amount) { /* ... */ }
}

// New payment method can be added without changing existing code
class CryptoPayment extends PaymentMethod {
  @override
  void process(double amount) { /* ... */ }
}

// The processor is now closed for modification but open for extension
class PaymentProcessor {
  void processPayment(double amount, PaymentMethod method) {
    method.process(amount);
  }
}
```

---

### 3. Liskov Substitution Principle (LSP)

> Subtypes must be substitutable for their base types without altering the program's correctness.

If you have a class `B` that is a subtype of class `A`, you should be able to use an object of `B` wherever an object of `A` is expected, without causing issues.

**Real-World Scenario: Document Storage**

Imagine you have a base class for storing documents.

**❌ Bad Practice:**

A subclass that throws an exception for a method it's expected to implement violates LSP.

```dart
abstract class Storage {
  void save(Document doc);
  Document load(String id);
}

class CloudStorage extends Storage {
  @override
  void save(Document doc) { /* Saves to cloud */ }
  
  @override
  Document load(String id) { /* Loads from cloud */ }
}

// Read-only storage cannot fulfill the 'save' contract
class ReadOnlyLocalStorage extends Storage {
  @override
  void save(Document doc) {
    // This violates the contract. A read-only storage cannot save.
    throw UnsupportedError("This storage is read-only!");
  }

  @override
  Document load(String id) { /* Loads from local disk */ }
}
```
If a function expects a `Storage` object, passing a `ReadOnlyLocalStorage` instance to it and calling `save()` would crash the app.

**✅ Good Practice:**

Segregate interfaces based on capabilities (related to ISP).

```dart
// Interface for reading
abstract class ReadableStorage {
  Document load(String id);
}

// Interface for writing, extends reading
abstract class WritableStorage extends ReadableStorage {
  void save(Document doc);
}

// Now classes can implement the interface that fits their capability
class CloudStorage implements WritableStorage {
  @override
  void save(Document doc) { /* ... */ }
  
  @override
  Document load(String id) { /* ... */ }
}

class ReadOnlyLocalStorage implements ReadableStorage {
  @override
  Document load(String id) { /* ... */ }
}
```

---

### 4. Interface Segregation Principle (ISP)

> Clients should not be forced to depend on interfaces they do not use.

It's better to have many small, specific interfaces than one large, "fat" interface.

**Real-World Scenario: Worker Actions**

Imagine a generic `Worker` interface for different types of workers in a system.

**❌ Bad Practice:**

A single, large interface forces all implementers to define methods they may not need.

```dart
abstract class IWorker {
  void work();
  void eat();
  void sleep();
}

class HumanWorker implements IWorker {
  @override
  void work() { /* ... */ }
  @override
  void eat() { /* ... */ }
  @override
  void sleep() { /* ... */ }
}

class RobotWorker implements IWorker {
  @override
  void work() { /* ... */ }

  // A robot doesn't need to eat or sleep.
  // These methods are irrelevant and must be given empty implementations.
  @override
  void eat() {}
  @override
  void sleep() {}
}
```

**✅ Good Practice:**

Break down the fat interface into smaller, role-based interfaces.

```dart
abstract class Workable {
  void work();
}

abstract class Feedable {
  void eat();
}

abstract class Restable {
  void sleep();
}

// A Human can do all three
class HumanWorker implements Workable, Feedable, Restable {
  @override
  void work() { /* ... */ }
  @override
  void eat() { /* ... */ }
  @override
  void sleep() { /* ... */ }
}

// A Robot only needs to work
class RobotWorker implements Workable {
  @override
  void work() { /* ... */ }
}
```

---

### 5. Dependency Inversion Principle (DIP)

> 1. High-level modules should not depend on low-level modules. Both should depend on abstractions.
> 2. Abstractions should not depend on details. Details should depend on abstractions.

This principle decouples modules. High-level business logic should not be tied to low-level implementation details like a specific database or network client. This is the core of Clean Architecture's dependency rule.

**Real-World Scenario: Fetching News Articles**

A high-level module (like a Cubit) needs to fetch news. It shouldn't know *how* the news is fetched (from an API, a database, etc.).

**❌ Bad Practice:**

The `NewsCubit` directly depends on `NewsApiService`, a low-level concrete class. This makes it hard to test and impossible to switch the data source without changing the Cubit.

```dart
// Low-level module
class NewsApiService {
  Future<List<Article>> fetchArticles() {
    // Makes a Dio/http call to a specific API endpoint
  }
}

// High-level module
class NewsCubit extends Cubit<NewsState> {
  final NewsApiService _apiService = NewsApiService(); // Direct dependency!

  void getNews() async {
    final articles = await _apiService.fetchArticles();
    // emit state
  }
}
```

**✅ Good Practice:**

Both high-level and low-level modules depend on an abstraction (`NewsRepository`).

```dart
// The Abstraction (e.g., in the Domain layer)
abstract class NewsRepository {
  Future<List<Article>> fetchArticles();
}

// Low-level module (e.g., in the Data layer)
// It depends on the abstraction.
class NewsRepositoryImpl implements NewsRepository {
  final NewsApiService _apiService; // Depends on another low-level detail
  NewsRepositoryImpl(this._apiService);

  @override
  Future<List<Article>> fetchArticles() {
    return _apiService.fetchArticles();
  }
}

// High-level module (e.g., in the Presentation layer)
// It also depends on the abstraction.
class NewsCubit extends Cubit<NewsState> {
  final NewsRepository _repository; // Dependency is inverted!

  NewsCubit(this._repository); // Injected via constructor

  void getNews() async {
    final articles = await _repository.fetchArticles();
    // emit state
  }
}
```
With this setup, we can easily provide a `MockNewsRepository` for testing or a `CachedNewsRepository` that fetches from a local database, all without modifying `NewsCubit`.