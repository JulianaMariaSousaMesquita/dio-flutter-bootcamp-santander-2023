import 'package:project002_poo_dart/classes/pessoa.dart';
import 'package:project002_poo_dart/service/NotificacaoInterface.dart';

class NotificacaoPushNotification implements NotificacaoInterface {
  @override
  void EnviarNotificacao(Pessoa pessoa) {
    print("Enviando Push Notification para: ${pessoa.getNome()}");
  }
}
