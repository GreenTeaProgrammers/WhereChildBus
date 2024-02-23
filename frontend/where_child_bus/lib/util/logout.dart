import 'package:flutter/material.dart';
import 'package:where_child_bus/pages/auth_page/auth_page.dart';

class Logout {
  static void logout(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const AuthPage()));
  }
}
