import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/guardian.pbgrpc.dart';
import 'package:where_child_bus_guardian/app.dart';
import 'package:where_child_bus_guardian/models/guardian_login_error.dart';
import 'package:where_child_bus_guardian/util/api/guardian.dart';

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

  void login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      setState(() => _loginError = GuardianLoginError.fieldsDoNotFilled);
      return;
    }

    try {
      final res = await guardianLogin(email, password);
      if (res.success) {
        developer.log("$res");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => App()));
      } else {
        setState(() => _loginError = GuardianLoginError.invalidCredentials);
      }
    } catch (error) {
      developer.log("Login Failed for error: ", error: error);
      setState(() => _loginError = GuardianLoginError.invalidCredentials);
    }
  }

  Widget pageBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            titleText(),
            mailInputField(),
            passwordInputField(),
            spacer32(),
            errorTextWidget(),
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

  Widget mailInputField() =>
      textFieldWidget(_emailController, 'メールアドレス', TextInputType.emailAddress);

  Widget passwordInputField() => textFieldWidget(
      _passwordController, 'パスワード', TextInputType.visiblePassword,
      obscureText: true);

  Widget textFieldWidget(TextEditingController controller, String label,
          TextInputType keyboardType,
          {bool obscureText = false}) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration:
              InputDecoration(border: OutlineInputBorder(), labelText: label),
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
        ),
      );

  Widget spacer32() => const SizedBox(height: 32);

  Widget errorTextWidget() {
    String errorText;
    switch (_loginError) {
      case GuardianLoginError.invalidCredentials:
        errorText = "メールアドレスかパスワードが間違っています";
        break;
      case GuardianLoginError.unknown:
        errorText = "不明なエラーです";
        break;
      case GuardianLoginError.fieldsDoNotFilled:
        errorText = "パスワードとメールアドレスを入力してください";
        break;
      default:
        return Container();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(errorText,
          style: const TextStyle(color: Colors.red, fontSize: 13)),
    );
  }

  Widget loginButton() => SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ElevatedButton(
            onPressed: () =>
                login(_emailController.text, _passwordController.text),
            child: const Text('ログイン')),
      );
}
