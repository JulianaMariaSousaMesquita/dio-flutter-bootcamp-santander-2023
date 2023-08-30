import 'package:project002_poo_dart/classes/pessoa.dart';
import 'package:project002_poo_dart/service/NotificacaoInterface.dart';

class NotificacaoSMS implements NotificacaoInterface {
  @override
  void EnviarNotificacao(Pessoa pessoa) {
    print("Enviando SMS para: ${pessoa.getNome()}");
  }
}
