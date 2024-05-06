import 'package:flutter/material.dart';
import 'package:flutter_gymapp/_comun/minhas_cores.dart';
import 'package:flutter_gymapp/_comun/validacoes_formularios.dart';
import 'package:flutter_gymapp/componentes/decoracao_campo_autenticacao.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
  bool queroEntrar = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  MinhasCores.pretoTopoGradiente,
                  MinhasCores.pretoBaixoGradiente
                ])),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      height: 128,
                    ),
                    const Text(
                      "GymApp",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    TextFormField(
                      decoration: getAuthenticationInputDecoration("E-mail"),
                      validator: (String? value) {
                        if (value == null) {
                          return 'Por favor, insira um e-mail.';
                        }

                        if (!ValidaFormulario.isValidEmail(value)) {
                          return 'Por favor, insira um e-mail válido.';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: getAuthenticationInputDecoration("Senha"),
                      obscureText: true,
                       validator: (String? value) {
                              if (value!.length < 3) {
                                return 'Por favor, insira uma senha válida.';
                              }

                              return null;
                            },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Visibility(
                      visible: !queroEntrar,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: getAuthenticationInputDecoration(
                                "Confirme senha"),
                            obscureText: true,
                            validator: (String? value) {
                              if (value!.length < 3) {
                                return 'Por favor, insira a confirmação da senha.';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            decoration:
                                getAuthenticationInputDecoration("Nome"),
                            validator: (String? value) {
                              if (value!.length < 3) {
                                return 'Por favor, insira um nome válido.';
                              }

                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ValidaFormulario.botaoClicarFormChmaValidator(_formKey);
                      },
                      child: Text(
                        (queroEntrar) ? "Entrar" : "Cadastrar",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          queroEntrar = !queroEntrar;
                        });
                      },
                      child: Text(
                          (queroEntrar)
                              ? "Ainda não tem uma conta? Cadastre-se!"
                              : "Entrar",
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Text("Esqueci minha senha!",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
