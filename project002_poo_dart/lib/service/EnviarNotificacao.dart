// ignore_for_file: file_names

import 'package:project002_poo_dart/classes/pessoa.dart';
import 'package:project002_poo_dart/enum/tipo_notificacao.dart';
import 'package:project002_poo_dart/service/NotificacaoInterface.dart';
import 'package:project002_poo_dart/service/impl/NotificacaoEmail.dart';
import 'package:project002_poo_dart/service/impl/NotificacaoPushNotification.dart';
import 'package:project002_poo_dart/service/impl/NotificacaoSMS.dart';

class EnviarNotificacao {
  NotificacaoInterface? notificacao;

  void notificar(Pessoa pessoa) {
    switch (pessoa.getTipoNotificacao()) {
      case TipoNotificacao.EMAIL:
        notificacao = NotificacaoEmail();
        break;
      case TipoNotificacao.PUSH_NOTIFICATION:
        notificacao = NotificacaoPushNotification();
        break;
      case TipoNotificacao.SMS:
        notificacao = NotificacaoSMS();
        break;
      default:
        return;
    }
    if (notificacao != null) {
      notificacao!.EnviarNotificacao(pessoa);
    }
  }
}
