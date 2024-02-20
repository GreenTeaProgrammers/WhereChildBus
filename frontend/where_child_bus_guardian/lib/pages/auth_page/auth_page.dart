import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:where_child_bus_guardian/app.dart';
import 'package:where_child_bus_guardian/models/guardian_login_error.dart';
import 'package:where_child_bus_guardian/util/api/guardian.dart';
import 'package:where_child_bus_guardian/util/guardian_data.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/guardian.pb.dart';

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

  login() async {
    BuildContext currentContext = context;
    GuardianLoginResponse res;

    try {
      if (kDebugMode) {
        res = await guardianLogin("guardian1@example.com", "password");
      } else {
        res = await guardianLogin(
            _emailController.text, _passwordController.text);
        if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
          setState(() => _loginError = GuardianLoginError.fieldsDoNotFilled);
          return;
        }
      }

      if (res.success) {
        print(res.success);
        print(res.guardian.name);
        GuardianData().setGuardian(res.guardian);
        Navigator.pushReplacement(
            currentContext,
            MaterialPageRoute(
              builder: (BuildContext context) => App(),
            ));
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
          decoration: InputDecoration(
              border: const OutlineInputBorder(), labelText: label),
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
        child:
            ElevatedButton(onPressed: () => login(), child: const Text('ログイン')),
      );
}
