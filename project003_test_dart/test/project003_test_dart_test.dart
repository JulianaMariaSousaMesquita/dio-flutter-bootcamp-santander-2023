import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:project003_test_dart/classes/route_zip_zode.dart';
import 'package:project003_test_dart/project003_test_dart.dart';
import 'package:test/test.dart';

import 'project003_test_dart_test.mocks.dart';

@GenerateMocks([MockRouteZipCode])
void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });

  test('calculate02', () {
    expect(calculate(), greaterThan(41));
  });

  test('calculate03', () {
    expect(calculateDiscount(500, 150, false), 350);
  });

  test('calculate04', () {
    expect(calculateDiscount(500, 15, true), 425);
  });

  test('calculate05', () {
    expect(calculateDiscount(1000, 15, true), 850);
  });

  test('calculate06', () {
    // ignore: deprecated_member_use
    expect(() => calculateDiscount(0, 150, false),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  test('calculate07', () {
    // ignore: deprecated_member_use
    expect(() => calculateDiscount(3000, 0, true),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  group("Calcular o valor do produto com desconto", () {
    var valuesToTest = {
      {'value': 500, 'discount': 150, 'percentage': false}: 350,
      {'value': 500, 'discount': 15, 'percentage': true}: 425,
      {'value': 1000, 'discount': 150, 'percentage': false}: 850,
      {'value': 1000, 'discount': 15, 'percentage': true}: 850,
    };
    valuesToTest.forEach((values, expected) {
      test('calculate08-GROUP', () {
        expect(
            calculateDiscount(
                double.parse(values["value"].toString()),
                double.parse(values["discount"].toString()),
                bool.parse(values["percentage"].toString())),
            equals(expected));
      });
    });
  });

  group(
      "Calcular o valor do produto com desconto com porcentagem passando o valor do produto zerado",
      () {
    var valuesToTest = {
      {'value': 0, 'discount': 150, 'percentage': false}: 850,
      {'value': 1000, 'discount': 0, 'percentage': true}: 850,
    };
    valuesToTest.forEach((values, expected) {
      test('calculate09-GROUP', () {
        expect(
            () => calculateDiscount(
                double.parse(values["value"].toString()),
                double.parse(values["discount"].toString()),
                bool.parse(values["percentage"].toString())),
            throwsA(TypeMatcher<ArgumentError>()));
      });
    });
  });

  test('Testar conversão para uppercase', () {
    expect(convertToUpperCase("dio"), equals("DIO"));
  });

  test('Retornar CEP', () async {
    RouteZipCode zipCode = RouteZipCode();    
    var body = await zipCode.returnZipCode("01001000");
    expect(body["bairro"], equals("Sé"));
    expect(body["logradouro"], equals("Praça da Sé"));
    expect(body["localidade"], equals("São Paulo"));

    MockMockRouteZipCode mockRouteZipCode = MockMockRouteZipCode();
    when(mockRouteZipCode.returnZipCode("01"))
        .thenAnswer((realInvocation) => Future.value({
              "cep": "01001-000",
              "logradouro": "Praça da Sé",
              "complemento": "lado ímpar",
              "bairro": "Sé",
              "localidade": "São Paulo",
              "uf": "SP",
              "ibge": "3550308",
              "gia": "1004",
              "ddd": "11",
              "siafi": "7107"
            }));
    var bodyMock = await mockRouteZipCode.returnZipCode("01");
    expect(bodyMock["complemento"], equals("lado ímpar"));
  });
}

class MockRouteZipCode extends Mock implements RouteZipCode {
}
