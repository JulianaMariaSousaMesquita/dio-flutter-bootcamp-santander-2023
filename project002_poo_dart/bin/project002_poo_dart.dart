
//import 'package:project002_poo_dart/classes/pessoa.dart';
import 'package:project002_poo_dart/classes/pessoa_fisica.dart';
import 'package:project002_poo_dart/classes/pessoa_juridica.dart';
import 'package:project002_poo_dart/enum/tipo_notificacao.dart';
import 'package:project002_poo_dart/service/EnviarNotificacao.dart';

void main(List<String> arguments) {
  // var p1 = Pessoa("Joana","Casa da Joana");
  // print(p1.toString());
  // p1.setNome("Juliana Maria de Sousa Mesquita");
  // p1.setEndereco("Rua 24, joão pessoa tals");
  // print(p1.getNome());
  // print(p1.getEndereco());
  // print(p1.toString());

  var p2Fisica = PessoaFisica("Carlos Abreu", "Rua 15 de setembro, SG", "15825865744", tipoNotificacao: TipoNotificacao.EMAIL,);
  print(p2Fisica.toString());

  var p3Juiridica = PessoaJuridica("DIGITAL INNOVATION ONE", "Cidade de Araraquara, estado de São Paulo, à Avenida Sete de Setembro, 371, Sala 03, Centro, CEP: 14800-390", "26.965.884/0001-02", tipoNotificacao: TipoNotificacao.SMS);
  print(p3Juiridica.toString());

  var p4Fisica = PessoaFisica("Joana Darc", "Rua treze de maio, RJ", "158112365744");
  print(p4Fisica.toString());

  EnviarNotificacao enviarNotificacao = EnviarNotificacao();
  enviarNotificacao.notificar(p2Fisica);
  enviarNotificacao.notificar(p3Juiridica);
  enviarNotificacao.notificar(p4Fisica);
}
