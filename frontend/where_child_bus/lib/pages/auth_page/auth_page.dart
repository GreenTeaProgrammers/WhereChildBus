import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:where_child_bus/proto-gen/where_child_bus/v1/nursery.pbgrpc.dart';
import 'package:where_child_bus/util/api/nursery_login.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
            loginButton(),
          ],
        ),
      ),
    );
  }

  Widget titleText() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 32),
      child: Text(
        'WhereChildBus',
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

  login() async {
    try {
      NurseryLoginResponse res = await nurseryLogin(
          _emailController.text, _passwordController.text);
      
      if (res.success) {
        print(res.success);
        print(res.nursery.name);
        //  ログイン成功後の処理をここに記述
      } else {
        //  ログイン失敗時の処理をここに記述
        print('Login failed');
      }
    } catch (e) {
      //  エラーハンドリング
      print('An error occurred: $e');
      //  エラーメッセージを表示するか、ユーザーに通知するなどの処理を行う
    }
  }

  Widget spacer32() {
    return const SizedBox(
      height: 32,
    );
  }
}
