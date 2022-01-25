import 'package:email_validator/email_validator.dart';

mixin ValidatorMixin {
  String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email cannot be empty';
    } else if (!EmailValidator.validate(email)) {
      return 'Email format is not valid';
    }
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password cannot be empty';
    }
  }

  String? usernameValidator(String? username) {
    if (username == null || username.isEmpty) {
      return 'Username cannot be empty';
    }
  }
}
