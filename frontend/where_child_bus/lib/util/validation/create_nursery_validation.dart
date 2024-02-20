bool validateFields(String name, String email, String phoneNumber,
    String address, String password, String confirmPassword) {
  return email.isNotEmpty &&
      phoneNumber.isNotEmpty &&
      address.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      name.isNotEmpty;
}

bool validateEmailFormat(String email) {
  RegExp emailValidator = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
  return emailValidator.hasMatch(email);
}

bool validatePasswordsMatch(String password, String confirmPassword) {
  return password == confirmPassword;
}
