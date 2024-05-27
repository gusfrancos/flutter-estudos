import 'package:flutter/material.dart';
import 'package:flutter_gymapp/_comun/meu_snackbar.dart';
import 'package:flutter_gymapp/_comun/minhas_cores.dart';
import 'package:flutter_gymapp/_comun/validacoes_formularios.dart';
import 'package:flutter_gymapp/componentes/decoracao_campo_autenticacao.dart';
import 'package:flutter_gymapp/servicos/autenticacao_servicos.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
  bool queroEntrar = true;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();
  AutenticacaoServico _autenticacaoServico = AutenticacaoServico();

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
                      controller: _emailController,
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
                      controller: _senhaController,
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
                            controller: _nomeController,
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
                        botaoClicarFormChamaValidator();
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

  botaoClicarFormChamaValidator() {
    if (_formKey.currentState!.validate()) {
      if (queroEntrar) {
        print("Entrada Validada");
      } else {
        print("Cadastro Validado");
        print(
            "${_emailController.text},{$_senhaController.text},{$_nomeController.text}");
        _autenticacaoServico
            .cadastrarUsuario(
          nome: _nomeController.text,
          senha: _senhaController.text,
          email: _emailController.text,
        )
            .then((String? erro) {
          if (erro != null) {
            mostrarSnackBar(context: context, texto: erro);
          } else {
            mostrarSnackBar(
                context: context,
                texto: "Cadastro efetuado com sucesso!",
                isErro: false);
          }
        });
      }
    } else {
      print("Form inválido");
    }
  }
}
