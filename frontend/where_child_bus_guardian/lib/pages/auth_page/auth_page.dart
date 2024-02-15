import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:where_child_bus_guardian/models/guardian_login_error.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  GuardianLoginError? _loginError;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: pageBody(),
      ),
    );
  }

  Widget pageBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            titleText(),
            mailInputField(),
            passwordInputField(),
            spacer32(),
            if (_loginError != null &&
                _loginError == GuardianLoginError.invalidCredentials)
              emailOrPasswordNotFound(),
            loginButton(),
          ],
        ),
      ),
    );
  }

  Widget titleText() => const Padding(
        padding: EdgeInsets.only(bottom: 32),
        child: Text('WhereChildBus',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
      );

  Widget mailInputField() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'メールアドレス'),
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
        ),
      );

  Widget passwordInputField() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'パスワード'),
          controller: _passwordController,
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
        ),
      );

  Widget spacer32() => const SizedBox(height: 32);

  Widget emailOrPasswordNotFound() => const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "メールアドレスかパスワードが間違っています",
          style: TextStyle(color: Colors.red, fontSize: 13),
        ),
      );

  Widget loginButton() => SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ElevatedButton(onPressed: () {}, child: const Text('ログイン')),
      );
}
