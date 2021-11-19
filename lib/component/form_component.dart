import 'package:flutter/material.dart';

Widget formCom(
    TextEditingController cntrl, String hintText, String validatorText) {
  return Padding(
    padding: const EdgeInsets.only(top: 30, right: 18, left: 18),
    child: TextFormField(
      controller: cntrl,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.grey[200],
        errorStyle: const TextStyle(color: Colors.red),
        filled: true,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5.0)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return validatorText;
        }
        return null;
      },
    ),
  );
}
