// Código feito pro arthur L. kroenke, Marcos Gabriel, João Pedro, Guilherme Paes e Alisson Alves, Sesi senai Itajai SC, 29/09/2022
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _resultados = [
    1,
    2,
    3,
  ];

  var _caminho = [
    "assets/images/pedra.png",
    "assets/images/papel.png",
    "assets/images/tesoura.png",
  ];

  var _resultado = "Clique abaixo\n para jogar!";
  var _caminhoVariavel = "assets/images/sinal-de-interrogacao.png";
  var _caminhoVariavelJogador = "assets/images/sinal-de-interrogacao.png";

  final isSelected = <bool>[false, false, false];

  void _confirmationDiolog() {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Por favor confirme'),
            content: const Text('Tem certeza que selecionou certo?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                    _chamarFuncao();
                  },
                  child: const Text('Sim')),
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('Não'))
            ],
          );
        });
  }

  void _chamarFuncao() {
    if (isSelected[0] && isSelected[1] ||
        isSelected[0] && isSelected[2] ||
        isSelected[1] && isSelected[2]) {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
                title: const Text('Erro!!!'),
                content: const Text('Foram selecionados mais de uma opção'),
                actions: [
                  // The "Yes" button
                  TextButton(
                      onPressed: () {
                        // Close the dialog
                        Navigator.of(context).pop();
                      },
                      child: const Text('Arrumar')),
                ]);
          });
    } else {
      if (isSelected[0]) {
        _paper();
      }
      if (isSelected[1]) {
        _rock();
      }
      if (isSelected[2]) {
        _scissor();
      }
      if (!isSelected[0] && !isSelected[1] && !isSelected[2]) {
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return AlertDialog(
                  title: const Text('Erro!!!'),
                  content:
                      const Text('Não foram selecionados nenhuma das opções'),
                  actions: [
                    // The "Yes" button
                    TextButton(
                        onPressed: () {
                          // Close the dialog
                          Navigator.of(context).pop();
                        },
                        child: const Text('Arrumar')),
                  ]);
            });
      }
    }
  }

  //Papel = 1 Pedra = 2 Tesorua = 3
  void _paper() {
    var numeroSorteado = Random().nextInt(_resultados.length);

    if (_resultados[numeroSorteado] == 1) {
      setState(() {
        _caminhoVariavel = "assets/images/papel.png";
        _resultado = "Ocorreu um empate";
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Color.fromRGBO(9, 0, 50, 1),
            systemNavigationBarColor: Color.fromRGBO(9, 0, 50, 1),
          ),
        );
      });
    }
    if (_resultados[numeroSorteado] == 2) {
      setState(() {
        _caminhoVariavel = "assets/images/pedra.png";
        _resultado = "Você venceu";
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 0, 187, 56),
            systemNavigationBarColor: Color.fromARGB(255, 0, 187, 56),
          ),
        );
      });
    }
    if (_resultados[numeroSorteado] == 3) {
      setState(() {
        _caminhoVariavel = "assets/images/tesoura.png";
        _resultado = "Você foi Derrotado";
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 160, 0, 0),
            systemNavigationBarColor: Color.fromARGB(255, 160, 0, 0),
          ),
        );
      });
    }
  }

  void _rock() {
    var numeroSorteado = Random().nextInt(_resultados.length);

    if (_resultados[numeroSorteado] == 1) {
      setState(() {
        _caminhoVariavel = "assets/images/papel.png";
        _resultado = "Você foi Derrotado";
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 160, 0, 0),
            systemNavigationBarColor: Color.fromARGB(255, 160, 0, 0),
          ),
        );
      });
    }
    if (_resultados[numeroSorteado] == 2) {
      setState(() {
        _caminhoVariavel = "assets/images/pedra.png";
        _resultado = "Ocorreu um empate";
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Color.fromRGBO(9, 0, 50, 1),
            systemNavigationBarColor: Color.fromRGBO(9, 0, 50, 1),
          ),
        );
      });
    }

    if (_resultados[numeroSorteado] == 3) {
      setState(() {
        _caminhoVariavel = "assets/images/tesoura.png";
        _resultado = "Você venceu";
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 0, 187, 56),
            systemNavigationBarColor: Color.fromARGB(255, 0, 187, 56),
          ),
        );
      });
    }
  }

  void _scissor() {
    var numeroSorteado = Random().nextInt(_resultados.length);

    if (_resultados[numeroSorteado] == 1) {
      setState(() {
        _caminhoVariavel = "assets/images/papel.png";
        _resultado = "Você venceu";
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 0, 187, 56),
            systemNavigationBarColor: Color.fromARGB(255, 0, 187, 56),
          ),
        );
      });
    }
    if (_resultados[numeroSorteado] == 2) {
      setState(() {
        _caminhoVariavel = "assets/images/pedra.png";
        _resultado = "Você foi Derrotado";
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 160, 0, 0),
            systemNavigationBarColor: Color.fromARGB(255, 160, 0, 0),
          ),
        );
      });
    }
    if (_resultados[numeroSorteado] == 3) {
      setState(() {
        _caminhoVariavel = "assets/images/tesoura.png";
        _resultado = "Ocorreu um empate";
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Color.fromRGBO(9, 0, 50, 1),
            systemNavigationBarColor: Color.fromRGBO(9, 0, 50, 1),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pedra - Papel - Tesoura - Escola S",
          style: TextStyle(fontFamily: "Oswald", fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 115, 115, 180),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                  width: 5, color: Color.fromARGB(255, 115, 115, 180))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 115, 115, 180),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(104, 60, 183, 169),
                        spreadRadius: 5),
                  ],
                ),
                width: 10000000.0,
                child: Text(
                  "jogador - maquina",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 35,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontFamily: "Poppins-Light"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _caminhoVariavelJogador,
                    width: 120,
                    height: 120,
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 16.0)),
                  Image.asset(
                    _caminhoVariavel,
                    width: 120,
                    height: 120,
                  ),
                ],
              ),
              Text(
                _resultado + "!!!",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 45,
                    fontStyle: FontStyle.italic,
                    fontFamily: "Oswald",
                    color: Color.fromARGB(255, 249, 178, 76)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ToggleButtons(
                    color: Colors.black.withOpacity(0.60),
                    selectedColor: Color(0xF9B24C),
                    selectedBorderColor: Color.fromARGB(255, 115, 115, 180),
                    fillColor:
                        Color.fromARGB(185, 115, 115, 180).withOpacity(0.20),
                    splashColor:
                        Color.fromARGB(255, 115, 115, 180).withOpacity(0.12),
                    hoverColor:
                        Color.fromARGB(255, 115, 115, 180).withOpacity(0.04),
                    borderRadius: BorderRadius.circular(4.0),
                    constraints: BoxConstraints(minHeight: 36.0),
                    isSelected: isSelected,
                    onPressed: (index) {
                      // Respond to button selection
                      setState(() {
                        isSelected[index] = !isSelected[index];
                        if (isSelected[0]) {
                          _caminhoVariavelJogador =
                              "assets/images/papelButao.png";
                        }
                        if (isSelected[1]) {
                          _caminhoVariavelJogador =
                              "assets/images/pedraButao.png";
                        }
                        if (isSelected[2]) {
                          _caminhoVariavelJogador =
                              "assets/images/tesouraButao.png";
                        }
                      });
                    },
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Image.asset(
                          "assets/images/papelButao.png",
                          width: 80,
                          height: 80,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Image.asset(
                          "assets/images/pedraButao.png",
                          width: 80,
                          height: 80,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Image.asset(
                          "assets/images/tesouraButao.png",
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: _confirmationDiolog,
                child: Text(
                  "Confirmar",
                  style: TextStyle(fontSize: 30, fontFamily: "Poppins-Light"),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 60, 183, 168),
                ),
              ),
              Image.asset(
                "assets/images/LogoEscolaSColorido.png",
                width: 200,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
