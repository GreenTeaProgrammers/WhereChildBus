import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: pageBody(),
      ),
    );
  }

  void register() {}

  Widget pageBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          titleText(),
          mailInputField(),
          passwordInputField(),
          confirmPasswordInputField(),
          const SizedBox(
            height: 32,
          ),
          registerButton(),
        ],
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

  Widget confirmPasswordInputField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'パスワードの確認',
        ),
        controller: _confirmPasswordController,
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
      ),
    );
  }

  Widget registerButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ElevatedButton(
        onPressed: () => (),
        child: const Text('登録'),
      ),
    );
  }
}
