import 'package:flutter/material.dart';
import "dart:developer" as developer;
import 'package:where_child_bus/util/api/nursery_register.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/nursery.pb.dart';

enum CreateNurseryError {
  unknown,
  invalidEmail,
  emailAlreadyExist,
  networkError,
  passwordsDoNotMatch
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  CreateNurseryError? _createError;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: pageBody(),
      ),
    );
  }

  void register() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _createError = CreateNurseryError.passwordsDoNotMatch;
      });
      return;
    }

    try {
      CreateNurseryResponse res = await createNursery(
        _emailController.text,
        _passwordController.text,
        _phoneNumberController.text,
        _addressController.text,
      );
    } catch (err) {
      developer.log("Caught error", error: err);
    }
  }

  Widget pageBody() {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 32,
              ),
              titleText(),
              mailInputField(),
              phoneNumberInputField(),
              addressInputField(),
              passwordInputField(),
              confirmPasswordInputField(),
              const SizedBox(
                height: 32,
              ),
              registerButton(),
            ],
          ),
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

  Widget phoneNumberInputField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: '電話番号',
          ),
          controller: _phoneNumberController,
          keyboardType: const TextInputType.numberWithOptions(
              signed: false, decimal: false)),
    );
  }

  Widget addressInputField() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: '住所',
          ),
          controller: _addressController,
        ));
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
