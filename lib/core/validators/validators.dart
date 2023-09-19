import 'package:email_validator/email_validator.dart';
import 'package:rxdart/rxdart.dart';

class RxRequireValidator {
  final String text;
  final BehaviorSubject<String> stream = BehaviorSubject<String>();

  RxRequireValidator(this.text);

  void validate(String value) {
    if (value.isEmpty) {
      stream.sink.addError("$text is required.");
    } else {
      stream.sink.add(value);
    }
  }

  bool checkValidation() {
    if (stream.hasError == false && stream.hasValue == false) {
      stream.sink.addError("$text is required.");
      return false;
    }

    return true;
  }
}

class RxEmailValidator {
  final BehaviorSubject<String> stream = BehaviorSubject<String>();

  void validate(String email) {
    if (email.isEmpty) {
      stream.sink.addError("Email is required.");
    } else if (EmailValidator.validate(email) == false) {
      stream.sink.addError("Email is invalid.");
    } else {
      stream.sink.add(email);
    }
  }

  bool checkValidation() {
    if (stream.hasError == false && stream.hasValue == false) {
      stream.sink.addError("Email is required.");
      return false;
    }

    return true;
  }
}

class RxPhoneNumValidator {
  final BehaviorSubject<String> stream = BehaviorSubject<String>();

  void validate(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      stream.sink.addError("Phone number is required");
    } else if (!RegExp(r"(^(?:[+0]9)?[0-9]{10,10}$)").hasMatch(phoneNumber) ||
        phoneNumber.length != 10) {
      stream.sink.addError("Invalid phone number");
    } else {
      stream.sink.add(phoneNumber);
    }
  }

  bool checkValidation() {
    if (stream.hasError == false && stream.hasValue == false) {
      stream.sink.addError("Phone number is required.");
      return false;
    }

    return true;
  }
}

class RxYearValidator {
  final BehaviorSubject<String> stream = BehaviorSubject<String>();

  void validate({required String year, required String text}) {
    if (year.isEmpty) {
      stream.sink.addError("$text year is required");
    } else if (double.tryParse(year) == null || year.length != 4) {
      stream.sink.addError("Invalid year");
    } else {
      stream.sink.add(year);
    }
  }

  bool checkValidation(String text) {
    if (stream.hasError == false && stream.hasValue == false) {
      stream.sink.addError("$text is required.");
      return false;
    }

    return true;
  }
}

class RxIntegerValidator {
  final String text;
  final BehaviorSubject<String> stream = BehaviorSubject<String>();

  RxIntegerValidator(this.text);

  void validate(String integer) {
    if (integer.isEmpty) {
      stream.sink.addError("$text is required");
    } else if (double.tryParse(integer) == null) {
      stream.sink.addError("Invalid number");
    } else {
      stream.sink.add(integer);
    }
  }

  bool checkValidation() {
    if (stream.hasError == false && stream.hasValue == false) {
      stream.sink.addError("$text is required.");
      return false;
    }

    return true;
  }
}
