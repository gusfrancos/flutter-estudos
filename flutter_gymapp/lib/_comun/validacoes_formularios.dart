import 'package:flutter/material.dart';

class ValidaFormulario {
  // Função para validar se o e-mail está no formato correto.
  static bool isValidEmail(String email) {
    // Utilizando uma expressão regular para validar o formato do e-mail.
    final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }
}
