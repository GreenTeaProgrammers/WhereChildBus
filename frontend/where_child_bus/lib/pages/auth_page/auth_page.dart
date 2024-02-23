import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:where_child_bus/app.dart';
import 'package:where_child_bus/pages/register_page/register_page.dart';
import 'package:where_child_bus/util/api/nursery_login.dart';
import 'package:where_child_bus/models/nursery_data.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/nursery.pb.dart';

import 'widget/register_button.dart';

enum NurseryLoginError {
  unknown,
  invalidCredentials,
  serverError,
  networkError,
  databaseError,
  //  他のエラータイプをここに追加
}

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  NurseryLoginError? _loginError;

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
    List<Widget> columnChildren = [
      titleText(),
      mailInputField(),
      passwordInputField(),
      spacer32(),
      if (_loginError != null &&
          _loginError == NurseryLoginError.invalidCredentials)
        emailOrPasswordNotFound(),
      loginButton(),
      RegisterButton(context: context),
    ];

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: columnChildren,
        ),
      ),
    );
  }

  Widget titleText() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 32),
      child: Text(
        'ほいくるーず',
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget mailInputField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'メールアドレス',
        ),
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget passwordInputField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'パスワード',
        ),
        controller: _passwordController,
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
      ),
    );
  }

  Widget loginButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ElevatedButton(
        onPressed: () => login(),
        child: const Text('ログイン'),
      ),
    );
  }

  Widget emailOrPasswordNotFound() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "メールアドレスかパスワードが間違っています",
        style: TextStyle(
          color: Colors.red,
          fontSize: 13,
        ),
      ),
    );
  }

  login() async {
    BuildContext currentContext = context;
    NurseryLoginResponse res;
    try {
      if (kDebugMode) {
        res = await nurseryLogin("demo@example.com", "password");
      } else {
        res =
            await nurseryLogin(_emailController.text, _passwordController.text);
      }

      if (res.success) {
        developer.log("${res.success}");
        developer.log(res.nursery.name);
        NurseryData().setNursery(res.nursery);
        Navigator.pushReplacement(
          currentContext,
          MaterialPageRoute(
            builder: (BuildContext context) => App(),
          ),
        );
      } else {
        //  ログイン失敗時の処理をここに記述
        developer.log('Login failed');
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _loginError = NurseryLoginError.invalidCredentials;
        });
      }
    }
  }

  Widget spacer32() {
    return const SizedBox(
      height: 32,
    );
  }
}
