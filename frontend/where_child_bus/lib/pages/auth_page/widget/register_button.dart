import 'package:flutter/material.dart';
import 'package:where_child_bus/pages/register_page/register_page.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterPage(),
              ),
            );
          },
          child: const Text('新規登録はこちら'),
        ),
      ),
    );
  }
}
