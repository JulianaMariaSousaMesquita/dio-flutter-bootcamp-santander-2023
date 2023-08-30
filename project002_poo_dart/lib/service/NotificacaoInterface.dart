import 'package:project002_poo_dart/classes/pessoa.dart';
import 'package:project002_poo_dart/service/EnviarNotificacao.dart';

abstract class NotificacaoInterface {
  void EnviarNotificacao(Pessoa pessoa);
}
