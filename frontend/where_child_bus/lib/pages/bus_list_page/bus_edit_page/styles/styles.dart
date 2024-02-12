import "package:flutter/material.dart";

ButtonStyle editButtonStyle () {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300),
    minimumSize: MaterialStateProperty.all<Size>(Size(60, 60)),
    shape: MaterialStateProperty.all<CircleBorder>(
      const CircleBorder(
        side: BorderSide(
          color: Colors.white,
          width: 1,
          style: BorderStyle.solid,
        ),
      )
    )
  );
}

InputDecoration editPageInputDecoration(String labelText, String hintText) {
  return InputDecoration(
    labelText: labelText,
    hintText: hintText,
    border: const OutlineInputBorder(),
  );
}

TextStyle normalText() {
  return const TextStyle(
    color: Colors.black,
    fontSize: 16,
  );
}