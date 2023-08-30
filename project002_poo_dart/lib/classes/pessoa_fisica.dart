import 'package:project002_poo_dart/classes/pessoa.dart';
import 'package:project002_poo_dart/enum/tipo_notificacao.dart';

class PessoaFisica extends Pessoa {
  String _cpf = '';

  PessoaFisica(String nome, String endereco, String cpf, {TipoNotificacao tipoNotificacao = TipoNotificacao.NENHUM})
      : super(nome, endereco, tipoNotificacao: tipoNotificacao) { 
    _cpf = cpf;
  }

  void setCpf(String cpf) {
    _cpf = cpf;
  }

  String getCpf() {
    return _cpf;
  }

  @override
  String toString() {
    return {" PESSOA FISICA = Nome": getNome(), "Endereço": getEndereco(), "Tipo Notificação ": getTipoNotificacao(), "CPF": _cpf}
        .toString();
  }
}
