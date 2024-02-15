import 'package:flutter/material.dart';
import 'package:where_child_bus/app.dart';
import "dart:developer" as developer;
import 'package:where_child_bus/util/api/nursery_create.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/nursery.pb.dart';
import "package:where_child_bus/models/create_nursery_error.dart";

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
    //フィールドが全て埋まっているか確認
    if (!validateFields(
        _emailController.text,
        _phoneNumberController.text,
        _addressController.text,
        _passwordController.text,
        _confirmPasswordController.text)) {
      return;
    }

    //メールアドレスが有効な形式かどうか確認
    if (!validateEmailFormat(_emailController.text)) {
      return;
    }

    //パスワードが一致しているかどうか確認
    if (!validatePasswordsMatch(
        _passwordController.text, _confirmPasswordController.text)) {
      return;
    }

    try {
      CreateNurseryResponse res = await createNursery(
        _emailController.text,
        _passwordController.text,
        _phoneNumberController.text,
        _addressController.text,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => App(
            nursery: res.nursery,
          ),
        ),
      );
    } catch (err) {
      developer.log("Caught error", error: err);
      setState(() {
        _createError = CreateNurseryError.unknown;
      });
    }
  }

  bool validateFields(String email, String phoneNumber, String address,
      String password, String confirmPassword) {
    if (email.isEmpty ||
        phoneNumber.isEmpty ||
        address.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      setState(() {
        _createError = CreateNurseryError.fieldsDoNotFilled;
      });
      return false;
    }
    return true;
  }

  bool validateEmailFormat(String email) {
    RegExp emailValidator = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    if (!emailValidator.hasMatch(email)) {
      setState(() {
        _createError = CreateNurseryError.invalidEmail;
      });
      return false;
    }
    return true;
  }

  bool validatePasswordsMatch(String password, String confirmPassword) {
    if (password != confirmPassword) {
      setState(() {
        _createError = CreateNurseryError.passwordsDoNotMatch;
      });
      return false;
    }
    return true;
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
              if (_createError != null) errorMessage(_createError!),
              registerButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget errorMessage(CreateNurseryError createError) {
    late String errorMessageText;
    if (createError == CreateNurseryError.passwordsDoNotMatch) {
      errorMessageText = "パスワードが一致していません";
    } else if (createError == CreateNurseryError.fieldsDoNotFilled) {
      errorMessageText = "全てのフィールドを入力してください";
    } else if (createError == CreateNurseryError.invalidEmail) {
      errorMessageText = "メールアドレスが有効な形式ではありません";
    } else {
      errorMessageText = "不明なエラーです";
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(errorMessageText,
          style: const TextStyle(
            color: Colors.red,
          )),
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
        onPressed: () => register(),
        child: const Text('登録'),
      ),
    );
  }
}
