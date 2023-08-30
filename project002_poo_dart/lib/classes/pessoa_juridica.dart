import 'package:project002_poo_dart/classes/pessoa.dart';
import 'package:project002_poo_dart/enum/tipo_notificacao.dart';

class PessoaJuridica extends Pessoa {
  String _cnpj = '';

  PessoaJuridica(String nome, String endereco, String cnpj, {TipoNotificacao tipoNotificacao = TipoNotificacao.NENHUM}) : super(nome, endereco, tipoNotificacao : tipoNotificacao) {
    _cnpj = cnpj;
  }

  void setCnpj(String cnpj) {
    _cnpj = cnpj;
  }

  String getCnpj() {
    return _cnpj;
  }

  @override
  String toString() {
    return {" PESSOA JURIDICA = Nome": getNome(), "Endereço": getEndereco(), "Tipo Notificação ": getTipoNotificacao(), "CNPJ": _cnpj}.toString();
  }
}