import "package:flutter/material.dart";

class ConfirmButton extends StatelessWidget {
  final String buttonText;
  final double fontSize = 20;    

  ConfirmButton({required String this.buttonText});

  @override
  Widget build(BuildContext context) {
    return confirmButton(context);
  }

  Widget confirmButton(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: fontSize * 2,
          child: ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            child: Text(
              buttonText,
              style: buttonTextStyle(),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle buttonTextStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: fontSize, 
    );
  }
}
