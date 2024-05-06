import 'package:flutter/material.dart';

InputDecoration getAuthenticationInputDecoration(String label) {
  return InputDecoration(
      //label: Text(label),
      //floatingLabelBehavior: FloatingLabelBehavior.never,
      filled: true,
      fillColor: Colors.grey[200], // Define a cor de fundo aqui
      contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      hintText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      /*enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(color: Colors.black, width:2)
                        ),*/

      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide:
              const BorderSide(color: Colors.lightBlueAccent, width: 4)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide: const BorderSide(color: Colors.red, width: 2)),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.0),
        borderSide: const BorderSide(color: Colors.red, width: 5),
      ));
}
