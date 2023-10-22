import 'package:flutter/material.dart';
import 'viacep_service.dart';
import 'back4app_service.dart';
import 'cep_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CEP App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ViaCepService viaCepService = ViaCepService();
  final Back4AppService back4AppService = Back4AppService();

  TextEditingController cepController = TextEditingController();
  List<CEP> cepList = [];

  @override
  void initState() {
    super.initState();
    // Carregar a lista de CEPs do Back4App ao iniciar a página
    loadCEPsFromBack4App();
  }

  void loadCEPsFromBack4App() async {
    // Implemente a lógica para carregar a lista de CEPs do Back4App
    // e atualizar o estado (cepList) com os CEPs carregados.
  }

  void searchCEP() async {
    String cep = cepController.text;
    Map<String, dynamic> cepData = await viaCepService.getCEP(cep);

    // Verificar se o CEP já existe no Back4App
    if (cepData != null) {
      // Se existe, atualize o CEP no Back4App
      await back4AppService.updateCEPInBack4App(cep, cepData);
    } else {
      // Se não existe, adicione o CEP ao Back4App
      await back4AppService.addCEPToBack4App(cepData);
    }

    // Atualize a lista de CEPs após a consulta/atualização
    loadCEPsFromBack4App();
  }

  void deleteCEP(CEP cep) async {
    // Implemente a lógica para excluir o CEP do Back4App e atualizar a lista.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CEP App'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: cepController,
            decoration: InputDecoration(labelText: 'CEP'),
          ),
          ElevatedButton(
            onPressed: searchCEP,
            child: Text('Consultar CEP'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cepList.length,
              itemBuilder: (context, index) {
                CEP cep = cepList[index];
                return ListTile(
                  title: Text(cep.cep),
                  subtitle: Text(cep.logradouro),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => deleteCEP(cep),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}