import 'package:project002_poo_dart/enum/tipo_notificacao.dart';

abstract class Pessoa {
  String _nome = "";
  String? _endereco;
  TipoNotificacao _tipoNotificacao = TipoNotificacao.NENHUM;
  String _email = "";
  String _celular = "";
  String _token = "";


  Pessoa(String nome, String endereco, {TipoNotificacao tipoNotificacao = TipoNotificacao.NENHUM}){
    _nome = nome;
    _endereco = endereco;
    _tipoNotificacao = tipoNotificacao;    
  }

  void setNome(String nome) {
    _nome = nome;
  }

  String getNome() {
    return _nome.toUpperCase();
  }

  void setEndereco(String endereco) {
    _endereco = endereco;
  }

  String? getEndereco() {
    return _endereco;
  }

  void setEmail(String email) {
    _email = email;
  }

  String getEmail() {
    return _email;
  }

  void setCelular(String celular) {
    _celular = celular;
  }

  String getCelular() {
    return _celular;
  }

  void setToken(String token) {
    _token = token;
  }

  String getToken() {
    return _token;
  }

  void  setTipoNotificacao(TipoNotificacao tipoNot){
    _tipoNotificacao = tipoNot;
  }

  TipoNotificacao getTipoNotificacao(){
    return _tipoNotificacao;
  }

  @override
  String toString() {
    // TODO: implement toString 
    return {"PESSOA = Nome": _nome, "Endereço": _endereco}.toString();
  }
}
