import 'package:flutter/material.dart';
import 'package:flutter_gymapp/_comun/minhas_cores.dart';
import 'package:flutter_gymapp/models/exercicio_modelo.dart';
import 'package:flutter_gymapp/models/sentimento_modelo.dart';

class ExercicioTela extends StatelessWidget {
  ExercicioTela({super.key});

  final ExercicioModelo exercicio = ExercicioModelo(
    id: "EX001",
    nome: "Flexão de Braço",
    treino: "Peitoral",
    comoFazer:
        "Deite no chão e empurre seu corpo para cima usando seus braços.",
  );

  final List<SentimentoModelo> listaSentimentos = [
    SentimentoModelo(
        id: "SE001", sentindo: "Pouca ativação", data: "2024-04-17"),
    SentimentoModelo(id: "SE002", sentindo: "Ativação", data: "2024-04-18"),
    SentimentoModelo(
        id: "SE003", sentindo: "Pouca ativação", data: "2024-04-17"),
    SentimentoModelo(id: "SE004", sentindo: "Ativação", data: "2024-04-18"),
    SentimentoModelo(
        id: "SE005", sentindo: "Pouca ativação", data: "2024-04-17"),
    SentimentoModelo(id: "SE006", sentindo: "Ativação", data: "2024-04-18"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Column(
            children: [
              Text(exercicio.nome,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
              )),
              Text(exercicio.treino, style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
              )),
            ],
          ),
          centerTitle: true,
          backgroundColor: MinhasCores.azulEscuro,
          elevation: 0,
          toolbarHeight: 72,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(32)
          )), 
        ), 
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("FAB Foi clicado");
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          margin: const EdgeInsets.all((8)),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: ListView(
            children: [
              SizedBox(
                height: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Enviar foto"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Tirar foto"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Como fazer?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                exercicio.comoFazer,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              const Text(
                "Como estou me sentindo?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(listaSentimentos.length, (index) {
                  SentimentoModelo sentimentoAgora = listaSentimentos[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(sentimentoAgora.sentindo),
                    subtitle: Text(sentimentoAgora.data),
                    leading: const Icon(Icons.double_arrow),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        print("DELETAR ${sentimentoAgora.sentindo}");
                      },
                    ),
                  );
                }),
              )
            ],
          ),
        ));
  }
}
