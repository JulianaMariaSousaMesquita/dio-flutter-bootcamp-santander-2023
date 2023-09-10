import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black, // Cor dos botões
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white), // Cor do texto
        ),
        scaffoldBackgroundColor:
            Colors.transparent, // Cor de fundo transparente
        backgroundColor: Colors.transparent, // Cor de fundo transparente
        canvasColor: Colors.transparent, // Cor de fundo transparente
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de IMC'),
        ),
        body: Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String result = "";
  String classification = ""; // Variável para armazenar a classificação

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF00DBDE), Color(0xFFFC00FF)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Peso (kg)',
              ),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Altura (m)',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                calculateBMI();
              },
              child: Text('Calcular IMC'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Cor do botão
              ),
            ),
            SizedBox(height: 16.0),
            Text('Resultado: $result',
            style: Theme.of(context).textTheme.bodyText1),
            Text('Classificação: $classification',
            style: Theme.of(context).textTheme.bodyText1), // Exibir a classificação
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;

    if (weight > 0 && height > 0) {
      double bmi = weight / (height * height);
      setState(() {
        result = 'Seu IMC é ${bmi.toStringAsFixed(2)}';
        classification = classifyBMI(bmi); // Chamar a função de classificação
      });
    } else {
      setState(() {
        result = 'Por favor, insira valores válidos para peso e altura.';
        classification = ''; // Limpar a classificação em caso de erro
      });
    }
  }

  // Função para classificar o IMC com base nas faixas especificadas
  String classifyBMI(double bmi) {
    if (bmi < 16) {
      return 'MAGREZA GRAVE';
    } else if (bmi <= 17) {
      return 'MAGREZA MODERADA';
    } else if (bmi <= 18.5) {
      return 'MAGREZA LEVE';
    } else if (bmi <= 25) {
      return 'SAUDÁVEL';
    } else if (bmi <= 30) {
      return 'SOBREPESO';
    } else if (bmi <= 35) {
      return 'OBESIDADE GRAU 1';
    } else if (bmi <= 40) {
      return 'OBESIDADE GRAU 2 (SEVERA)';
    } else {
      return 'OBESIDADE GRAU 3 (MÓRBIDA)';
    }
  }
}
