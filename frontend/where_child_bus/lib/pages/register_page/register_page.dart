import 'package:flutter/material.dart';
import 'package:where_child_bus/app.dart';
import "dart:developer" as developer;
import 'package:where_child_bus/util/api/nursery_create.dart';
import 'package:where_child_bus/util/nursery_data.dart';
import 'package:where_child_bus/util/validation/create_nursery_validation.dart';
import 'package:where_child_bus_api/proto-gen/where_child_bus/v1/nursery.pb.dart';
import '../../models/create_nursery_error.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
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
    // フィールドが全て埋まっているか確認
    if (!validateFields(
        _nameController.text,
        _emailController.text,
        _phoneNumberController.text,
        _addressController.text,
        _passwordController.text,
        _confirmPasswordController.text)) {
      setState(() => _createError = CreateNurseryError.fieldsDoNotFilled);
      return;
    }

    // メールアドレスが有効な形式かどうか確認
    if (!validateEmailFormat(_emailController.text)) {
      setState(() => _createError = CreateNurseryError.invalidEmail);
      return;
    }

    // パスワードが一致しているかどうか確認
    if (!validatePasswordsMatch(
        _passwordController.text, _confirmPasswordController.text)) {
      setState(() => _createError = CreateNurseryError.passwordsDoNotMatch);
      return;
    }

    try {
      CreateNurseryResponse res = await createNursery(
        _nameController.text,
        _emailController.text,
        _passwordController.text,
        _phoneNumberController.text,
        _addressController.text,
      );

      NurseryData().setNursery(res.nursery);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => App(),
        ),
      );
    } catch (err) {
      developer.log("Caught error", error: err);
      setState(() {
        _createError = CreateNurseryError.unknown;
      });
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
              const SizedBox(height: 32),
              titleText(),
              inputField(_nameController, '保育園名'),
              inputField(_emailController, 'メールアドレス',
                  keyboardType: TextInputType.emailAddress),
              inputField(_phoneNumberController, '電話番号',
                  keyboardType: TextInputType.phone),
              inputField(_addressController, '住所'),
              inputField(_passwordController, 'パスワード', isObscure: true),
              inputField(_confirmPasswordController, 'パスワードの確認',
                  isObscure: true),
              const SizedBox(height: 32),
              if (_createError != null) errorMessage(_createError!),
              registerButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleText() => const Padding(
        padding: EdgeInsets.only(bottom: 32),
        child: Text('WhereChildBus',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
      );

  Widget inputField(TextEditingController controller, String label,
          {TextInputType keyboardType = TextInputType.text,
          bool isObscure = false}) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          decoration:
              InputDecoration(border: OutlineInputBorder(), labelText: label),
          keyboardType: keyboardType,
          obscureText: isObscure,
        ),
      );

  Widget errorMessage(CreateNurseryError error) => Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Text(
          createNurseryErrorMessage(error),
          style: const TextStyle(color: Colors.red),
        ),
      );

  Widget registerButton() => SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ElevatedButton(onPressed: register, child: const Text('登録')),
      );
}

String createNurseryErrorMessage(CreateNurseryError error) {
  switch (error) {
    case CreateNurseryError.passwordsDoNotMatch:
      return "パスワードが一致していません";
    case CreateNurseryError.fieldsDoNotFilled:
      return "全てのフィールドを入力してください";
    case CreateNurseryError.invalidEmail:
      return "メールアドレスが有効な形式ではありません";
    default:
      return "不明なエラーです";
  }
}
